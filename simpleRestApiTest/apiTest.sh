#!/bin/bash

#This script will test the simple Flask API with a simple functional test and a load test.

#get the total number of user and the increment per second for load test part
echo 'Please input the total load test user number:'
read totalUser
echo 'please input load test user increment per second:'
read increment
totalTime=`expr $totalUser / $increment`


#Execute API server.
terminator -e "python3 flaskApi.py"

#Functional test with Pytest and requests.
echo "===The functional test is beginning.==="
echo "===The result of functional test is:==="
pytest apiRequests.py --no-header --no-summary


#Load test with Locust. Generate and open web interface.
#Load test the performance under some simulated user searching the keyword with duckduckgo.com
#Increase soft limit of the open file number for locust
ulimit -S -n 999999
gnome-terminal -- bash -c "locust -f locustFile.py -u $totalUser -r $increment --csv output/loadTest;exec bash &"& 2>/dev/null
gnome-terminal -- bash -c "python3 buttonClick.py $totalTime;exec bash &"& 2>/dev/null
echo "===The charts and table of load test result saved in ./output==="
loadCsvArr=$(sed -i 's/ /\_/g' output/loadTest_stats.csv|awk -F, 'FNR<=2{printf "%-18s\t%-20s\t%-12s\n" ,$10,$5,$17 }' output/loadTest_stats.csv)

#generate load test conclusion
python3 loadTestConclusion.py $totalUser $increment
