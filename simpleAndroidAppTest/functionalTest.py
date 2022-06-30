#利用appium為info.woodsmall.calculator.apk進行簡單加法測試，並且將最後結果畫面截圖儲存

from appium import webdriver
from os.path import expanduser
import time,sys


desired_caps = {

"deviceName": sys.argv[1],
"platformName": "Android",
"version": "7",
"app": "info.woodsmall.calculator.apk"
}
time.sleep(5)
driver = webdriver.Remote("http://localhost:4723/wd/hub", desired_caps)
time.sleep(5)
el3 =driver.find_element_by_id("info.woodsmall.calculator:id/btn9")
time.sleep(5)
el3.click()
time.sleep(5)
el4 = driver.find_element_by_id("info.woodsmall.calculator:id/btnPlus")
time.sleep(5)
el4.click()
time.sleep(5)
el5 = driver.find_element_by_id("info.woodsmall.calculator:id/btn9")
el5.click()
time.sleep(5)
el6 = driver.find_element_by_id("info.woodsmall.calculator:id/btnEqual")
el6.click()
time.sleep(5)
resultValue=driver.find_element_by_id("info.woodsmall.calculator:id/txtVal")
if resultValue.text==str(9+9):
	print("===functional test success===")
else:
	print("===functional test failed===")

time.sleep(5)
driver.get_screenshot_as_file('output/functionalTest.png')
print("===final snapshoot saved as output/functionalTest.png===")
driver.quit()
