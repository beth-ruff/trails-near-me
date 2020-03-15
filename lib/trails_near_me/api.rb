# find api to
# use set url
# build hashes out for objs
# call custom class .new method
# send those back to our CLI
require 'pry'
class TrailsNearMe::API 
    
    def self.get_trails(latitude, longitude)
        
        @trails_hash = HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=#{latitude}&lon=-#{longitude}&maxDistance=10&key=200699798-1b74d08b49d66670e2eaaf40f569df56")
        if (@trails_hash["message"])
            puts "Oops, we can't find those coordinates!"
        else 
            @trails_hash.each do |x|
                x[1].each.with_index(0) do |y, index|
                 trail_obj = {
                    name: y["name"],
                    location: y["location"],
                    difficulty: y["difficulty"],
                    length: y["length"],
                    url: y["url"]
                }
                TrailsNearMe::Trail.new(trail_obj)
                end
            end 
        end
    end
end 
   
            
