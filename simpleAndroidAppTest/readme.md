#testCalculator-description and usage:

There are two simple test to the calculator android app: functional test with appium, and a load test with MonkeyRunner of Android Studio.

First part is functional test, which tend to know whether 9+9=18, and save snapshoot of result.
Second part is loading test, randomly check for user event 10 times.



    

    $sh testCalculator.sh
    #press the pop-up appium "start server" button to start appium.


#environment and prerequisites:

  * Ubuntu 20.04 
  * Android Studio 3.5.2
  * Appium-linux-1.15.1.AppImage
  * Appium 1.15.1
  * Android Debug Bridge (adb)1.0.39

#demo and ouput:
![image](https://github.com/k-eeer/appiumTest/blob/master/appiumTestInPython.png)

As the output of demo, two test were passed.