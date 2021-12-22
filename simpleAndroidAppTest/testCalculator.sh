device=$(${HOME}/sdk/emulator/emulator -list-avds|head -1)

#if error "Running multiple emulators with the same AVD",run:
rm -f $HOME/.android/avd/${device}.avd/*lock

adb start-server
terminator -e "${HOME}/sdk/emulator/emulator -avd $device;exec bash"
deviceReady=
deviceReady=$(adb devices -l |grep "^emulator.*device")
while [ ! -n "$deviceReady" ];do
	sleep 1 
	deviceReady=$(adb devices -l |grep "^emulator.*device") 
done
sleep 30

adb  install  info.woodsmall.calculator.apk

echo "===functional test the info.woodsmall.calculator.apk on ${device}==="
terminator -e "$HOME/Appium-linux-1.15.1.AppImage;exec bash"
sleep 25
#press "start server"
python3 functionalTest.py $device


echo "===run load test with adb shell monkey==="
#run load test with adb shell monkey,10 times.
echo "===get  'ok' event number of the result:"
adb shell monkey -p info.woodsmall.calculator -v 10 |grep -oP 'Events injected: [[:digit:]]+'


