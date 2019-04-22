import requests
import json

class Security:
  def __init__(self):
    self.url = ''

  def hasSecurityFeatures(self, url):
    security_params = []
    page = requests.get(url)

    security_params.append(1 if url[4] == 's' else 0)
    security_params.append(len(page.cookies))

    return security_params

seObject = Security()
seObject.hasSecurityFeatures('https://www.google.com')