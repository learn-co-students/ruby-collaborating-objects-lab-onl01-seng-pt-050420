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

  def self.new_by_filename(file_name)
    artist_file_name = file_name.split(" - ")[0]
    song_file_name = file_name.split(" - ")[1]
    new_song_file = self.new(song_file_name)
    new_song_file.artist_name = artist_file_name
    new_song_file
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    @artist.add_song(self)
  end

end
