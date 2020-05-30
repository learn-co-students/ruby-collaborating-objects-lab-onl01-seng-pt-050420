class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
    import(path)
  end

  def files
    files = Dir.entries("./spec/fixtures/mp3s").select{|filename| filename.include?(".mp3")}
  end

  def import(list_of_filenames)
   # files = Dir.entries(list_of_filenames).select{|filename| filename.include?(".mp3")}
    files.each{ |filename| Song.new_by_filename(filename) }
  end
end
