class Artist 

attr_accessor :name 
@@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end 
  
  def self.all
    @@all
  end 
  
  def save
    @@all << self
  end 
  
   def add_song(song)
    song.artist = self
    @songs << song
  end
 
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
    artist_found = Artist.all.find {|a| a.name == name}
    if artist_found == nil
      new_artist = Artist.new(name)
    else
      artist_found
    end
  end 

  def print_songs
    @songs.each do |song| 
      puts song.name
    end 
  end 

end 