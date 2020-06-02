
class Song
    attr_accessor :name, :artist, :title
    @@all = []
  
    def initialize(name)
      @name = name
     @@all << self
    end
  
    def self.all
      @@all
    end

    def artist_name=(name)
        if (self.artist.nil?)
          self.artist = Artist.new(name)
        else
          self.artist.name 
        end
      end


#       def self.new_by_filename(file_name)
#         self.name = file_name.split(" - ")[0]
#         self.artist.name = file_name.split(" - ")[1]
#     end
#   end

    def self.new_by_filename(file)
        # parsed_file = file.split(" - ")
        new_song_artist = file.split(" - ")[0]
        new_song_name = file.split(" - ")[1]
        new_song = Song.new(new_song_name)
        new_song.artist=(new_song_artist)
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end 
  
end
