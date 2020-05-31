require 'pry'



class Song

  @@all = []

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    save
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name=(artist)
    new_song
    #binding.pry

  end

  def self.find_by_artist(artist)
    Song.all.select {|song| song.artist == artist}
  end

  def self.all
    @@all
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
    self.artist.add_song(self)
  end

  def save
    @@all << self
  end

end