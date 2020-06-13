class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    
    @name = name
    save
    
  end
  
  def save
    
    @@all << self
    
  end
  
  def self.all
    
    @@all
    
  end
  
  def self.new_by_filename(file)
    
    song_name = file.split(" - ")[1]
    song = Song.new(song_name)
    
    artist_name = file.split(" - ")[0]
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.artist.add_song(self)
    song
    
  end
  
  def artist_name=(name)
    
    self.artist = Artist.all.find {|artist| artist.name == name} || Artist.new(name)
    
  end
  
end