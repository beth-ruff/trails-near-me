class TrailsNearMe::Trail
    attr_accessor :name, :location, :difficulty, :length, :url
   @@all = []
   
    def initialize(hash)
        hash.each {|key, value| self.send(("#{key}="), value)}
        save 
    end

    # def self.create_from_collection(trails_array)
    #     trails_array.each {|trail|
    #     TrailsNearMe::Trail.new(trail)
    #     }
    # end 

    def self.all
        @@all
    end 

    def save
        @@all << self 
    end 

    # custom instance methods if needed

end 