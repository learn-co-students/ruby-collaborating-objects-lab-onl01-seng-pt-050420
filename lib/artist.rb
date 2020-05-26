class Artist
  attr_accessor :name, :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def add_song(song)
    @songs << song
  end
  
  def self.find_or_create_by_name(artist_name)
    if self.all.find {|artist| artist.name == artist_name} == nil
      self.new(artist_name)
    else
      self.all.find {|artist| artist.name == artist_name} 
    end
  end
  
  def print_songs
    @songs.each {|i| puts i.name}
  end
end