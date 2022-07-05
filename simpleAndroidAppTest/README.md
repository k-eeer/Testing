# 測試計算機 Android APP--描述及用法:

testCalculator.sh為主要腳本。本腳本將對一安裝在模擬機上的計算機APP進行 1)功能測試-測試 9+9是否為18,並將結果截圖儲存,以Appium 完成;  2)表現測試（此為負荷測試)-隨機進行10次使用者可能行為，以Android Studio中的MonkeyRunner完成。

    $sh testCalculator.sh
    #後續需按下Appium視窗中start server以開始Appium.


# 運行環境:

  * Ubuntu 20.04 
  * Android Studio 3.5.2
  * Appium-linux-1.15.1.AppImage
  * Appium 1.15.1
  * Android Debug Bridge (adb)1.0.39

# 實際結果:
![image](https://github.com/k-eeer/theTests/blob/main/simpleAndroidAppTest/output/demoAppTest.png)

結果如上圖所示.兩個測試均通過
