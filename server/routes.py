import bottle
import sys

# Importing project specific libraries
sys.path.append('../')
import response_time
import content
import security

@bottle.route('/')
def index():
  return bottle.template('prototype')

@bottle.post('/display')
def display():
  url = bottle.request.forms.get('wesbiteURL')
  print(url, "thanku !")

  responseTimeObject = response_time.ResponseTime()
  responses = responseTimeObject.return_response_time_list(url)

  contentObject = content.Distribution(url)
  distribution_array = contentObject.give_content_distribution()

  securityObject = security.Security()
  security_params = securityObject.hasSecurityFeatures(url)

  return bottle.template('display', responseTime = responses, \
    content = distribution_array, security = security_params)

bottle.run(host = 'localhost', port = 9099, debug = True)