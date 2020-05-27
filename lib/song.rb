class Song 
  
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @artist = artist
    @@all.push(self)
  end
  
  def self.all 
    return @@all
  end
  
  def self.new_by_filename(file_name)
    new_song = file_name.chomp(".mp3").split(" - ")
    song = Song.new(new_song[1])
    song.artist_name = new_song[0]
    return song
  end
  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
end