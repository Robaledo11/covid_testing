#!/usr/bin/env ruby



module CovidTesting
  class CovidSite 
    @@all = []

    def self.all
      @@all
    end

    attr_accessor :id, :name, :review_count, :rating, :location, :display_phone

    def initialize(attributes)
      attributes.each do |attribute_name,attribute_value|
        if self.respond_to?("#{attribute_name}=")
        self.send("#{attribute_name}=", attribute_value)
        end
      end
    end

    def self.find_by_number(number)
      self.all[number.to_i - 1]
    end

    def self.load_by_location(location)                                  #called class method w/ covid sites string
      location_results = API.yelp_search("COVID 19", location)
      @@all = self.search_results_from_collection(location_results)
    end

    def self.search_results_from_collection(search_results)
      search_results.map do |covid_info_hash|
        self.new(covid_info_hash)
      end
    end
      

    def details
      <<-HEREDOC
      
        #{self.name} has #{self.review_count} reviews with an average rating of #{self.rating}
        #{self.address}
        #{self.display_phone}
      HEREDOC
    end

    def address
      location["display_address"].join("\n")
    end
  end
end