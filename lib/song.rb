# class Song

#   attr_accessor :name, :artist
#   @@all = []

#   def initialize(name)
#     @name = name
#     @@all << self
#   end

#   def self.new_by_filename(filename)
#     song = self.new(filename.split(" - ")[1])
#     song.artist = Artist.new(filename.split(" - ")[0])
#     song
#   end

#   def artist_name=(name)
#     if (self.artist.nil?)
#       self.artist = Artist.find_or_create_by_name(name)
#     else
#       self.artist.name = name
#     end
#   end
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

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
