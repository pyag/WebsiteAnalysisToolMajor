from bs4 import BeautifulSoup
import urllib.request
import json

class Distribution:
  def __init__(self, url):
    self.url = url

  def give_content_distribution(self):
    url = self.url
    page = urllib.request.urlopen(url)
    html = page.read()
    soup = BeautifulSoup(html, "html.parser")

    content_distribution = []

    div = soup.find('div')
    if div != None:
      content_distribution.append(len(div))

    img = soup.find('img')
    if img != None:
      content_distribution.append(len(img))
    else:
      content_distribution.append(0)

    video = soup.find('video')
    if video != None:
      content_distribution.append(len(video))
    else:
      content_distribution.append(0)
    
    table = soup.find('table')
    if table != None:
      content_distribution.append(len(table))
    else:
      content_distribution.append(0)
    
    audio = soup.find('audio')
    if audio != None:
      content_distribution.append(len(audio))
    else:
      content_distribution.append(0)

    total = 0
    for x in content_distribution:
      total += int(x)

    if total == 0:
      return content_distribution

    for i in range(0, len(content_distribution)):
      content_distribution[i] /= total
      content_distribution[i] *= 100

    # print(content_distribution)
    return content_distribution

# Uncomment the code below only when you want
# to run this file as a single python file

# if __name__ == '__main__':
#   content = Distribution('http://www.google.com')
#   print(content.give_content_distribution())