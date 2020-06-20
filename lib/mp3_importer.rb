class MP3Importer
  attr_accessor :path, :song
  
  def initialize(path)
    @path = path
  end
  
  def files
   files = Dir.glob("#{path}/*.mp3")
   files.collect { |file| file.gsub("#{path}/", "")}
   #Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/", "")}
  end
  
  def import 
    files.each { |file| Song.new_by_filename }
  end

end

 # if file.include?(".mp3")
    #   array = file.chomp(".mp3").split(" - ")
    #   music = array[1]
    #   singer = array[0]
    #   @song = self.new
    #   @song.save
    #   @song.name = music
    #   @song.artist = singer
    # end