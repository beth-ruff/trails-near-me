class TrailsNearMe::API 
    
    def self.get_trails(latitude, longitude)
        
        @trails_hash = HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=#{latitude}&lon=#{longitude}&maxDistance=10&key=200699798-1b74d08b49d66670e2eaaf40f569df56")
        
        if (@trails_hash["message"])
            puts "Oops, we can't find those coordinates!"
        else
            trails_obj = {
                name: @trails_hash["trails"][0]["name"],
                location: @trails_hash["trails"][0]["location"],
                difficulty: @trails_hash["trails"][0]["difficulty"],
                length: @trails_hash["trails"][0]["length"],
                url: @trails_hash["trails"][0]["url"]
                }
            TrailsNearMe::Trail.new(trails_obj)
        end
    end
end 
   
            
