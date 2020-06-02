class MP3Importer
    attr_accessor :path, :size, :filenames, :name

   def initialize (path)
    @path = path
    
    
   end

  
   def files
    filenames = Dir.chdir(path) do |path|
      Dir.glob("*.mp3")
    end
    
  end
      

   
  def import
    files.each do |path|
      Song.new_by_filename(path)
    end
  end
end