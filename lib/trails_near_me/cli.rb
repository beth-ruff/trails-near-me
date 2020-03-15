class TrailsNearMe::CLI
    
    #start should greet user, give a description
    # get data from scraper/api file 
    #create new custom objs
    # all inside start method

    def start
        puts "Welcome to the Trails Near Me CLI!"
        puts "-------------"
        puts "This app will find hiking trails near you based on your latitude and longitude."
        puts "Please enter your latitude and longitude below:"
        latitude = gets.strip
        longitude = gets.strip
        if (latitude != "quit") || (longitude != "quit")
            @data = TrailsNearMe::API.get_trails(latitude, longitude)
            @objects = TrailsNearMe::Trail.all 
            display_info
        else 
            quit 
        end 
    end

    
    def display_info
        puts "Here is your list:"
        puts "-------------------"
        @objects.each.with_index(1) {|trail, index| puts "#{index}. #{trail.name}"}
        
        puts  "please make a selection by index number for more information:"
        input = gets.strip.downcase
        if(input.to_i > 0)
            @trail = @objects[input.to_i - 1]
            puts "distance: #{@trail.length} miles"
            puts "location: #{@trail.location}"
            puts "difficulty: #{@trail.difficulty}"
            puts "URL: #{@trail.url}"
            display_info
        elsif (input == "quit")
            quit 
        elsif (input == "menu")
            start
        else
            put  "Oops"
            display_info 
        end  
    end 

    #deal with inputs (loop to keep asking to get new info)
    # for example: while input != "exit" do 
    # display a list of something, or give examples of what we expect as input
    # get user input 
    # depending on what we get, do something
    # condition to check input for good value
    # else tell them try again

    def quit
        puts "Goodbye"
    end 

end 