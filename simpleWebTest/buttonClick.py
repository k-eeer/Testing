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
loadTestTable=driver.find_element_by_tag_name("table")
loadTestTable.screenshot("output/loadTestTable.png")
chartButton=driver.find_element_by_xpath("/html/body/div[2]/div[3]/nav/ul/li[2]/a")
time.sleep(2)
chartButton.click()
time.sleep(int(totalTime)+20)
canvasChart=driver.find_elements_by_tag_name("canvas")
fileName=["totalRequestsPerSecond","responseTimes(ms)","numberOfUsers"]
for i in range(len(fileName)):
	name=fileName[i]
	canvasChart[i].screenshot(f"output/{name}.png")
