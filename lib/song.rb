class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist=(artist)
    @artist = artist
  end

  def artist
    @artist
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    new_song = filename.split(" - ")
    song = Song.new(new_song[1])
    song.artist_name = new_song[0]
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
