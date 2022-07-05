# 測試網頁搜尋關鍵字功能-描述及用法:
testSearchKeyword.sh 為主要腳本，本腳本將對duckduckgo.com進行關鍵字搜尋的功能測試（使用pytest及Selenium），以及表現測試中的負荷測試（使用Locust）



    $sh testSearchKeyword.sh
    #後續請輸入此次負荷測試欲模擬的總人數以及每秒欲增加的人數.

# 運行環境:

  * Ubuntu 20.04 
  * pytest 5.4.3
  * pytest-html-2.1.1
  * geckodriver 0.26.0
  * Selenium server 3.141.59
  * locust 1.1.1
  * fake-headers 1.0.2

# 實際結果:
![image](https://github.com/k-eeer/Testing/blob/main/simpleWebTest/output/demo.png)
![image](https://github.com/k-eeer/Testing/blob/main/simpleWebTest/output/responseTimes(ms).png)
由最上圖知，功能測試通過;且顯示負荷測試模擬使用人數50人（每秒增加2人）的條件下，server每秒可接受的請求，以及中位數反應時間，95%反應時間，詳細結果檔案儲存位置。



