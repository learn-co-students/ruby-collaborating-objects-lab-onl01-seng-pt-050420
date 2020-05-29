class Artist

attr_accessor :name, :artist

@@all = []
    
    def initialize(name)
      @name = name
      @@all << self    
    end

    def self.all
        @@all
    end

    def add_song(name)
        name.artist = self
    end

    def songs
      Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
      artist = self.all.detect {|x| x.name == name}
      if artist == nil
        artist = Artist.new(name)
      else
        artist
      end
    end


    def print_songs
      songs.each {|x| puts x.name}
    end
end