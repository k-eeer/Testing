device=$(${HOME}/sdk/emulator/emulator -list-avds|head -1)
rm -f $HOME/.android/avd/${device}.avd/*lock
terminator -e "appium"
adb kill-server
adb start-server
terminator -e "${HOME}/sdk/emulator/emulator -avd $device ;exec bash"
deviceReady=
deviceReady=$(adb devices -l |grep "^emulator.*device")
while [ ! -n "$deviceReady" ];do
	sleep 1 
	deviceReady=$(adb devices -l |grep "^emulator.*device") 
done
sleep 30
appExists=$(adb shell pm list packages | grep info.woodsmall.calculator)
if [ ! -n "$appExists" ];then
	adb  install  info.woodsmall.calculator.apk
fi



echo "===run load test with adb shell monkey==="
#run load test with adb shell monkey,get  'ok' event number of the result.
echo "===get  'ok' event number of the result:"
adb shell monkey -p info.woodsmall.calculator -v 10 |grep -oP 'Events injected: [[:digit:]]+'


