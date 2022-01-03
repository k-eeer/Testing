from locust import HttpUser, between, task,TaskSet
#from fake_headers import Headers
#from fp.fp import FreeProxy

class User(HttpUser):
    host = "http://127.0.0.1:5000"
    wait_time = between(5, 300)


    @task
    def searchDuckduckgo(self):
        self.client.get("/companies")
                    

