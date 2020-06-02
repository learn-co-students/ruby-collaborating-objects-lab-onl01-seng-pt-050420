require 'pry'
class Artist 
  
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
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
  
  def self.find_or_create_by_name(artist_name)
    Artist.all.select{|artist| artist.name == artist_name}
  end
  
  def print_songs
    x = songs
    i = 0 
    while i < x.length do  
      puts x[i].name
      i += 1 
    end

  end
  
end