
class MP3Importer

  attr_reader :path

    def initialize(path)
      @path = path
    end

    def files
      @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end
    def import
      self.files.each{|file| Song.new_by_filename(file)}
    end
end


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

  def self.new_by_filename(file)
    song_name = file.split(" - ")[1]
    artist = file.split(" - ")[0]
    song = self.new(song_name)
    song.artist_name = artist
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end

end

class Artist

  attr_accessor :name, :songs

  @@all = [] 

  def initialize(name)
    @name = name
    @songs = []
    @@all << self 
  end

  
  def self.all
    @@all
  end

  def add_song(song)

    @songs << song
  end

  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end


  def self.find(name)
    @@all.find do |artist|
      artist.name == name
    end
  end

  def self.create(name)
    artist = self.new(name)
    @@all << artist
    artist
  end



  def save
    @@all << self
  end

  def print_songs()
    puts @songs.collect {|x| x.name}
  end

end
