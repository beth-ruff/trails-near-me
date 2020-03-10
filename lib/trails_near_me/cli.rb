class TrailsNearMe::CLI
    
    #start should greet user, give a description
    # get data from scraper/api file 
    #create new custom objs
    # all inside start method

    def start
        puts "Hello there!"
        puts "-------------"
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
        
        puts  "please make a selection by index number:"
        input = gets.strip.downcase
        # @trail = @objects[input.to_i - 1]
        if(input.to_i > 0)
            @trail = @objects[input.to_i - 1]
            puts "#{@trail.length}"
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