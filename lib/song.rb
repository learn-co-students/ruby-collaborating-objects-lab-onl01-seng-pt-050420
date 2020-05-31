class Song
  @@all = []
  attr_accessor :name, :artist
  def initialize(name)
    @@all << self
    @name = name
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  def self.all
    @@all
  end
  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    song = Song.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.songs << song
    song
  end
end