class MP3Importer
    attr_accessor :path 

    def initialize(path)
        @path = path
    end

    def files #thank you stackoverflow
        file = Dir.glob("#{path}/*.mp3")
        file.collect {|file| file.split("/")[-1]}
    end

    def import 
        files.each {|file| Song.new_by_filename(file)}
    end
    
end