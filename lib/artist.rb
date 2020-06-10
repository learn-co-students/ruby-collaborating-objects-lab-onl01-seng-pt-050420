class Artist
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  
  
  def self.all
    @@all
  end
  
  def add_song(song)
    @songs << song
  end
  
  def self.find_or_create_by_name(name)
   
(my_artist = self.all.find {|artist| artist.name == name}) ? my_artist : self.new(name)
    end
  
  def print_songs
    self.songs.each do |song|
      puts song.name
  end
  
end
  
  
  
end