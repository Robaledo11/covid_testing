

module CovidTesting
  
  class API
      
    API_HOST = "https://api.yelp.com"
    SEARCH_PATH = "/v3/businesses/search"
    BUSINESS_PATH = "/v3/businesses/" 

    def self.api_key
      begin
        @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip
      rescue 
        puts "Whoops! looks like you haven't added your Yelp API key yet! Once you have
        your Yelp API key, come back and paste your API key here:"
        @@key = gets.strip
        return if @@key == "exit"
        File.open(File.expand_path("~/.yelp-api-key"), "w") do |file|
          file.print @@key
        end
      end
      @@key
    end

  
    def self.yelp_search(term, location)
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
        term: term,
        location: location
        
      }
    
      response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
      JSON.parse(response)["businesses"]
    end
  end
end