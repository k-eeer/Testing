import requests

"""This script test the REST API of DuckDuckGo.com
whether the output will be  expected."""


def testRestApiOfDuckduckgo():
	response = requests.get("https://api.duckduckgo.com/?q=kate&format=json")
	responseBody = response.json()
	assert responseBody["AbstractURL"] == "https://en.wikipedia.org/wiki/Kate"
