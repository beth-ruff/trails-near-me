class TrailsNearMe::API 
    
    def self.get_trails(latitude, longitude)
        
        @trails_hash = HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=#{latitude}&lon=#{longitude}&maxDistance=10&key=200699798-1b74d08b49d66670e2eaaf40f569df56")
        
        if (@trails_hash["message"])
            puts "Oops, we can't find those coordinates!"
        else
            @trails_hash["trails"].each do |trail|
            trails_obj = {
                name: trail["name"],
                location: trail["location"],
                difficulty: trail["difficulty"],
                length: trail["length"],
                url: trail["url"]
                }
                TrailsNearMe::Trail.new(trails_obj)
            end 
        end
    end
end 
   
            
