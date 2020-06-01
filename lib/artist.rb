class Artist
    @@all = []
    attr_accessor :name

    def self.all
        @@all
    end
    
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.find_or_create_by_name(name)

        self.all.detect { |artist| artist.name == name } || artist = self.new(name)
           
    end

    def add_song(song)
        # @songs << song
        song.artist = self

    end
    def songs
        Song.all.select {|song| song.artist == self}
        
    end
    def print_songs
      songs.each{|song| puts song.name}
    end
    
    
end