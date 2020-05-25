class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    # Takes an existing song instance and assigns it the artist
    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        self.all.detect {|artist| artist.name == name} || self.new(name)
    end

    # Returns an array of all Artist instances
    def self.all
        @@all
    end

    # Returns an array of songs for a specific artist 
    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

end