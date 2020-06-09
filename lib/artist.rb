class Artist
  attr_accessor :name, :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def self.find(name)
    self.all.detect {|artist| artist.name == name}
  end

  def self.create(name)
    artist = self.new(name)
    artist
  end

  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end

  def print_songs()
    puts @songs.collect {|x| x.name}
  end

end
