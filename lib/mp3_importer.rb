require 'Pry'

class MP3Importer
attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.each_child(path).map {|file| file}
        
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end


end