class MP3Importer
  attr_accessor :filename

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    mp3_files = Dir.entries(@path)
    mp3_files.each do |file|
      if file.length < 3
        mp3_files.delete(file)
      end
    end
    mp3_files
  end

  def import
    mp3_files = files
    mp3_files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
