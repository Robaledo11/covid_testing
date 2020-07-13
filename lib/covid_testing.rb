require "covid_testing/version"
require "http"
require_relative "covid_testing/api"
require_relative "covid_testing/cli"
require_relative "covid_testing/covidsite"

module CovidTesting
  class Error < StandardError; end
  # Your code goes here...
end
