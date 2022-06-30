#以下將啟動模擬機以及相關環境，以adb shell monkey模擬測試10次使用者行為，最後顯示通過測試次數

#得到並設定目前模擬機的名稱
device=$(${HOME}/sdk/emulator/emulator -list-avds|head -1)
rm -f $HOME/.android/avd/${device}.avd/*lock

#啟動appium與adb server
terminator -e "appium"
adb kill-server
adb start-server
terminator -e "${HOME}/sdk/emulator/emulator -avd $device ;exec bash"

#啟動模擬機
deviceReady=
deviceReady=$(adb devices -l |grep "^emulator.*device")
while [ ! -n "$deviceReady" ];do
	sleep 1 
	deviceReady=$(adb devices -l |grep "^emulator.*device") 
done
sleep 30

#若APP尚未安裝在模擬機上，則安裝
appExists=$(adb shell pm list packages | grep info.woodsmall.calculator)
if [ ! -n "$appExists" ];then
	adb  install  info.woodsmall.calculator.apk
fi


#以adb shell monkey模擬操作10次使用者行為，並且顯示成功通過的次數
echo "===run load test with adb shell monkey==="
#run load test with adb shell monkey,get  'ok' event number of the result.
echo "===get  'ok' event number of the result:"
adb shell monkey -p info.woodsmall.calculator -v 10 |grep -oP 'Events injected: [[:digit:]]+'


