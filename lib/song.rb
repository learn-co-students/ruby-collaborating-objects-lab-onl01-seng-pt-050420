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
    song_name = filename.split(" - ")[1]
    new_song = Song.new(song_name)
    the_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    new_song.artist = the_artist
    new_song.artist.add_song(self)
    new_song
  end
  
  # def artist_name=(name)
  #   (my_artist = self.all.find { |artist| artist.name == name }) ? my_artist : self.new(name)
  # end
  
end