class MP3Importer
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end  
    
    def files
        files = []
        Dir.new(self.path).each  do |file| 
            files << file if file.length > 4
            end 
        files             #HOW TO GOOGLE THIS? :/ 
    end 
    
    def import 
        files.each {|x| Song.new_by_filename(x)}
    end 

end 