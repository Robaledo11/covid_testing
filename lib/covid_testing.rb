require  "covid_testing/cli"
require  "covid_testing/covidsite"
require  "covid_testing/version" 
require  "covid_testing/api"
require  "http"

module CovidTesting
  class Error < StandardError; 
  # Your code goes here...
  end 
end

# CovidTesting::Api.yelp_search("Covid 19 Testing Site", "Covid 19 Testing", "coronavirus" "94580")

#This file loads all other files, similar to environment. 