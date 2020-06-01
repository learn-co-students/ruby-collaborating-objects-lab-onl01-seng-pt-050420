  
class Song
    attr_accessor :name, :artist
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end

    def self.new_by_filename(filename)
        parts = filename.split(" - ")
        artist_name = parts[0]
        song_name = parts[1]

    
        song = Song.new(song_name)
        song.artist_name=(artist_name)
        song

    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

  end