class Artist
    attr_accessor :name, :artist, :songs 
    @@all = []
    def initialize(name)
        @songs = []
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def add_song(song)
        @songs << song 
    end 
 
    #def self.find(name)
        #self.find(name){|artists| artists.name == name}
    #end 

   # def self.create(name)   #class method creates & stores instances vs initializing
        #artist = self.new(name)
        #@@all << artist
    #end 

    #def self.find_or_create_by_name(name) #takes in an argument b/c it's searching for/creating a name
        #if self.find.name
            #self.artist.name 
        #else
            #self.create 
        #end 
    #end

    def self.find_or_create_by_name(artist_name)
        found_artist = self.all.find {|artist| artist.name == artist_name}
        if found_artist
            found_artist
            
        else
            new_artist == self.new(artist_name)
            new_artist.save
            new_artist
        end      
    end
end 