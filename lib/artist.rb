require 'pry'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(artist)
    @name = artist
    @@all << self
  end

  def self.all
     @@all
  end

  def add_song(song)
    song.artist =  self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def self.find_or_create_by_name(name)
    artist_found = self.all.find {|artist_name| artist_name = name}
    if artist_found == nil
      artist = Artist.new(name)
    else
      artist_found
    end
  end

  def print_songs
    current_songs = Song.all.select {|song| song.artist == self}
    current_songs.each do |song|
      puts song.name
    end
  end
end
