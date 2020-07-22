

module CovidTesting
  
  class CLI

    def initialize
      @input = ""
    end

    def start    
      puts [  
        "-----------------------------------------------",
        "*  Welcome To The Covid 19 Test Site Finder CLI! *",    #Welcome message
        "-----------------------------------------------"
      ]
      while @input != "exit"
          set_location
          covid_site_results
      end
        goodbye
    end

    def set_location
      puts [  
        "\nLet's help you find a Testing Site, we base our selection from your location",      #puts a message
        "where are you located?"
      ]
      @location = gets.chomp     
      CovidSite.load_by_location(@location)
    end

    def covid_site_results
      list_covid_sites
      make_a_choice
      while @input != 'exit' && @input != 'back'
        if @input == 'list'
          list_covid_sites
        elsif valid?
          puts CovidSite.find_by_number(@input).details
        else
          puts [
            "\nplease make a valid choice from the list of options available",
            "If no options available, please type in 'back' and choose another location"
          ]
        end
        make_a_choice
      end
    end

    def list_covid_sites
      CovidSite.all.each.with_index(1) do |covid_site, index|
        puts "#{index}. #{covid_site.name}"
      end
    end

    def make_a_choice
      list_choices
      @input = gets.strip.downcase
    end

    def list_choices
      puts [

        "\nPlease choose from the many options available from the list, by selecting a number.",
        "\n> To see the list of choices again type 'list'.",
        "> To return back to the location menu type 'back'.",
        "> If your want to exit the Covid 19 Test Site Finder App, just type 'exit'."
      ]
    end
    
    def valid?
      @input.to_i.between?(1, CovidSite.all.length)
    end

    def goodbye
      puts "\nThanks for using the Covid 19 Testing Site Finder CLI, we hope you stay safe!!"
    end
  end
end