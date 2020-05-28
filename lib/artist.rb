class Artist  

    @@all = []

    attr_accessor :name 

    def initialize(name) 
        @name = name  
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def add_song(song) 
       song.artist = self
    end
    
    def songs 
        Song.all.select {|s| s.artist == self} 
    end   

    def self.create_by_name(name) 
        artist = self.new(name)
        artist.name = name 
        artist
    end

    def self.find_find_by_name(name) 
        @@all.find {|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_find_by_name(name) || self.create_by_name(name) 
    end 

    def print_songs 
        songs.each do |song|
             puts song.name
        end
    end

end