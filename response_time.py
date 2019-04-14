import concurrent.futures
import urllib
import time
import requests
import json

class ResponseTime:
  def __init__(self):
    self.sum = 0

  def makeRequest(self, url):
    return requests.get(url).elapsed.total_seconds()

  def calculateResponseTime(self, url, ntimes):
    urls = [url] * ntimes

    with concurrent.futures.ThreadPoolExecutor() as executor:
      for duration in executor.map(self.makeRequest, urls):
        self.sum += duration

  def return_response_time_list(self, url):
    response_times = []

    self.calculateResponseTime(url, 1)
    response_times.append(self.sum)
    print(self.sum, 's')
    self.sum = 0

    self.calculateResponseTime(url, 10)
    response_times.append(self.sum)
    print(self.sum, 's')
    self.sum = 0
    
    self.calculateResponseTime(url, 50)
    response_times.append(self.sum)
    print(self.sum, 's')
    self.sum = 0
    
    self.calculateResponseTime(url, 100)
    response_times.append(self.sum)
    print(self.sum, 's')
    self.sum = 0
    
    self.calculateResponseTime(url, 300)
    response_times.append(self.sum)
    print(self.sum, 's')
    self.sum = 0

    # print(response_times)
    return response_times

# if __name__ == '__main__':
#   responseObject = ResponseTime()
#   jsonObject = responseObject.return_response_time_list('http://www.google.com')
#   print(jsonObject)