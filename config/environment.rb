# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SearchApi::Application.initialize!


#require 'bossman'
#BOSSMan.application_id = "dj0yJmk9TUpxQmhWSWFUeUpoJmQ9WVdrOWRtNW5SVTloTnpZbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1iYQ--"

require 'yboss'
CONSUMER_KEY = "dj0yJmk9TUpxQmhWSWFUeUpoJmQ9WVdrOWRtNW5SVTloTnpZbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1iYQ--"
CONSUMER_SECRET = "f36f9ee4ebfb3efebc3d9b2c7cf2428ba5cb9da3"
YBoss::Config.instance.oauth_key = CONSUMER_KEY
YBoss::Config.instance.oauth_secret = CONSUMER_SECRET
