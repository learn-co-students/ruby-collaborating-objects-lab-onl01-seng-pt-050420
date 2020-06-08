require "pry"
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
    artist, title  = filename.split(" - ")
    self.new(title).tap {|song| 
      song.artist = Artist.find_or_create_by_name(artist)
      song.artist.add_song(song)
      }
  end
  
  def artist_name= (name_of_artist)
    self.artist = Artist.find_or_create_by_name(name_of_artist)
  end
  
end


