class Artist
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all 
    @@all
  end
  
  def self.find_or_create_by_name(name)
    (my_artist = self.all.find { |artist| artist.name == name }) ? my_artist : self.new(name)
  end
  
  def save 
    self.class.all << self
  end 
  
  def add_song(song)
    @songs << song
  end
  
  def songs 
    @songs
  end
  
  def print_songs
    self.songs.collect { |song| puts song.name }
  end
end