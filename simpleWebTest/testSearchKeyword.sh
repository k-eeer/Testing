#get the total number of user and the increment per second for load test part
echo 'Please input the total load test user number:'
read totalUser
echo 'please input load test user increment per second'
read increment
totalTime=`expr $totalUser / $increment`
#Functional test the keyword searching accuracy of duckduckgo.com
echo "The functional test is beginning."
echo "The result of functional test is:"
pytest functionalTest.py --no-header --no-summary

#Load test the performance under some simulated user searching the keyword with duckduckgo.com
#Increase soft limit of the open file number for locust
ulimit -S -n 999999
gnome-terminal -- bash -c "locust -f locustFile.py -u $totalUser -r $increment --csv output/loadTest;exec bash &"& 2>/dev/null

rm -f -- buttonClick.py
cat>>buttonClick.py<<EOF
from selenium import webdriver
import sys,time

filePath='loadTest.png'
totalTime=sys.argv[1]
driver=webdriver.Firefox()
driver.get("http://127.0.0.1:8089/")
time.sleep(5)
try:
	startButton=driver.find_element_by_xpath("/html/body/div[2]/div[1]/div[2]/form/button")
	startButton.click()
except:
	pass

time.sleep(int(totalTime)+20)

chartButton=driver.find_element_by_xpath("/html/body/div[2]/div[3]/nav/ul/li[2]/a")
time.sleep(2)
chartButton.click()
time.sleep(int(totalTime)+20)
canvasChart=driver.find_elements_by_tag_name("canvas")
fileName=["totalRequestsPerSecond","responseTimes(ms)","numberOfUsers"]
for i in range(len(fileName)):
	name=fileName[i]
	canvasChart[i].screenshot(f"output/{name}.png")
EOF

gnome-terminal -- bash -c "python3 buttonClick.py $totalTime;exec bash &"& 2>/dev/null

echo "The charts and table of load test result saved in ./output"
loadCsvArr=$(sed -i 's/ /\_/g' output/loadTest_stats.csv|awk -F, 'FNR<=2{printf "%-18s\t%-20s\t%-12s\n" ,$10,$5,$17 }' output/loadTest_stats.csv)

#generate load test conclusion
rm -f -- loadTestConclusion.py
cat>>loadTestConclusion.py<<EOF
import sys,linecache

totalUser=sys.argv[1]
increment=sys.argv[2]

namespace={}
result=[]
for i in 1,2:
        for j in 4,9,16:
                namespace['line%d' % i]= linecache.getline("output/loadTest_stats.csv",i)
                result.append((namespace['line%d' % i].split(',')[j]))
#print(*result, sep = ", ")
print("It's the result of %s users(increaseing %s users/second).According to the output/oadTest_stats.csv the server is able to handle %s requests per second. In the final figure below,the median response time(green line)-is %s ms, and 95%% response time(yellow line) is %s ms then."%(totalUser,increment,result[4],result[3],result[5])) 
EOF
python3 loadTestConclusion.py $totalUser $increment
