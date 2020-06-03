class Artist
    attr_accessor :name, :artist, :songs 
    @@all = []
    def initialize(name)
        @songs = []             #artist "has many" song 
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def add_song(song)
        @songs << song 
    end 
 
    def self.find(name)
        @@all.find{|artists| artists.name}
        
    end 

   def self.create(name)   #class method creates & stores instances vs initializing
        artist = self.new(name)
        artist
    end 

    def self.find_or_create_by_name(name) #takes in an argument b/c it's searching for/creating a name. Find an existed artist
        if self.find(name)           #if we find it 
            self.find(name) 
        else
           self.create(name)
        end    
    end

   def print_songs
       #puts songs.each {|x| x.name} 
        @songs.each do |x|
        puts x.name
        end 
   end 
    
end 

