class Song 
  
  attr_accessor :name, :artist

  @@all = []
  @songs = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def add_song(song)
    @songs << song
    song.artist = self
  end
  
  def songs 
    Song.all.select{|song| song.artist == self}
  end
  
end