# testRestApi-description and usage:

The script will generates a simple REST API by Flask and test it. Including 1) a functional test by Pytest and requests 2)a Performance test(Load test) by Locust. 



    
    $sh apiTest.sh
    #input the number of total users and increment per seconds for load test.


# environment and prerequisites:

  * Ubuntu 20.04 
  * Flask 1.1.2
  * requests 2.22.0
  * pytest 5.4.3
  * Locust 1.1.1



# demo and ouput:
![image](https://github.com/k-eeer/theTests/blob/main/simpleRestApiTest/output/demoRestApiTest.png)
![image](https://github.com/k-eeer/theTests/blob/main/simpleRestApiTest/output/responseTimes(ms).png)


As the output of demo, two tests were passed.
