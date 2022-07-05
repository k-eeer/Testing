# 測試REST API-描述及用法:

apiTest.sh 為主要腳本。本腳本將以Flask產生一簡單REST API並且進行以下測試：  1) 功能測試-以pytest以及Requests完成 2) 表現測試（此處為負荷測試）-以Locust完成. 

    $sh apiTest.sh
    #後續請輸入此次負荷測試欲模擬的總人數以及每秒欲增加的人數.


# 運行環境:

  * Ubuntu 20.04 
  * Flask 1.1.2
  * requests 2.22.0
  * pytest 5.4.3
  * Locust 1.1.1



# 實際結果:
![image](https://github.com/k-eeer/theTests/blob/main/simpleRestApiTest/output/demoRestApiTest.png)
![image](https://github.com/k-eeer/theTests/blob/main/simpleRestApiTest/output/responseTimes(ms).png)


由最上圖知，功能測試通過;且顯示負荷測試模擬使用人數50人（每秒增加2人）的條件下，server每秒可接受的請求，以及中位數反應時間，95%反應時間，詳細結果檔案儲存位置。
