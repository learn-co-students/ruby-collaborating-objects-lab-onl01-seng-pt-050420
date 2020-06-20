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
    # song_name = filename.split(" - ")[1]
    # new_song = Song.new(song_name)
    # the_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    # new_song.artist = the_artist
    # new_song.artist.add_song(self)
    # new_song
    
    artist, title = filename.split(" - ")
    self.new(title).tap { |song|
      song.artist = Artist.find_or_create_by_name(artist)
      song.artist.add_song(song)
    }
  end
  
  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end
  
end