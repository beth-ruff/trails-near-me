class TrailsNearMe::CLI
    
    #start should greet user, give a description
    # get data from scraper/api file 
    #create new custom objs
    # all inside start method

    def start
        puts "Welcome to the Trails Near Me CLI!"
        puts "

        (                 ,&&&.
        )                .,.&&
       (  (              \=__/
           )             ,'-'.
     (    (  ,,      _.__|/ /|
      ) /\ -((------((_|___/ |
    (  // | (`'      ((  `'--|
  _ -.;_/ \\--._      \\ \-._/.
 (_;-// | \ \-'.\    <_,\_\`--'|
 ( `.__ _  ___,')      <_,-'__,'
jrei  `'(_ )_)(_)_)'                "


        
        puts "------------------------------------"
        puts "------------------------------------"
        puts "This app will find hiking trails near you based on your latitude and longitude."
        puts "------------------------------------"
        puts "Hint: you can find a specific latitude and longitude by going to www.google.com/maps and entering your desired address. You can then right-click on the map's pin point, and from the new menu choose 'What's Here?' A box at the bottom of the page will appear with the coordinates that are required for your desired address."
        puts "------------------------------------"
        input_coords
    end
        
        
    def input_coords
        puts "Please enter your desired latitude below, then click return and enter your longitude:"
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
        make_selection
    end

    
    def make_selection
        puts  "Please make a selection by index number for more information, or type 'menu' to input more coordinates."
        input = gets.strip.downcase
        
        if(input.to_i > 0)
            @trail = @objects[input.to_i - 1]
            puts "name: #{@trail.name}"
            puts "distance: #{@trail.length} miles"
            puts "location: #{@trail.location}"
            puts "difficulty: #{@trail.difficulty}"
            puts "URL: #{@trail.url}"
            puts "---------------------------------"
            puts "To input more coordinates, type 'menu'. To get information on another trail on your list, type 'more info'. To quit, type 'quit'."
            input = gets.strip.downcase 

                if (input == "more info")
                    display_info
                elsif (input == "quit")
                    quit 
                elsif (input == "menu")
                    input_coords 
                else
                    put  "Oops"
                    display_info 
                end 
        elsif (input == "quit")
            quit
        elsif (input == "menu")
            input_coords
        else 
            put "Oops"
            display_info 
        end  
    end 

    def quit
        puts "Goodbye"
    end 

end 