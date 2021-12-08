from locust import HttpUser, between, task
from fake_headers import Headers


class WebsiteUser(HttpUser):
    host = "https://duckduckgo.com"
    wait_time = between(5, 300)


    
    @task(1)
    def testKeyword(self):
        header = Headers(
        browser="firefox",
        os="linux",
        headers=True  # generate misc headers
    )
        headerNow=header.generate()
        self.client.get("/?q=panda&atb=v183-1&ia=web",headers=headerNow)


        
