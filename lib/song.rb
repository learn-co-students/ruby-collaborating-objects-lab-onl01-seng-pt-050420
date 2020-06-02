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


# It must parse a filename to find the song name and artist name. (Hint: every file separates the song and artist with a " - "). Now we put those values to use.
# From here, we will create a new song instance using the string we gathered from the filename.
# We'll also want to associate that new song with an artist. Use the artist attribute accessor to assign this
# Return the new song instance.

    def self.new_by_filename(file)
        section = file.split(" - ")
        artist_name = section[0]
        song_name = section[1]
        song = Song.new(song_name)
        song.artist_name = (artist_name)
        song
    end

    def artist_name= (artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end



end 