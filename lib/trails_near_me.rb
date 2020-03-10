# environment file
# In here loads all files needed to run our app

require "trails_near_me/version"
require "trails_near_me/cli"
require "trails_near_me/api"
require "trails_near_me/trail"

# dependencies
require "pry"
require "httparty"

module TrailsNearMe
  class Error < StandardError; end
  # Your code goes here...
end
