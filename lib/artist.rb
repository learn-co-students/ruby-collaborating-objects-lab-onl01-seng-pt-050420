class Artist
    attr_accessor :name, :songs, :all, :save
  
    @@all = []
  
    def initialize(name)
      @name = name
        @@all << self  
      @songs = []
      save
    end

    def self.all
        
        @@all  #this will return the @@all arry thats been created
    end
  
    def add_song(song)
      @songs << song #this add songs to the songs array when the method is called
    end

    # def self.find(name)
    #     @@all.find {|artist| artist.name == name}
    
    #   end

    #   def self.create(name)
    #     artist = self.new(name)
    #     @@all << artist
    #     artist
    #   end

    # def self.find_or_create_by_name(name)
        
        def self.find_or_create_by_name(artist_name)
            found_artist = self.all.find {|artist| artist.name == artist_name}
            if found_artist
                found_artist
            else
              new_artist = self.new(artist_name)
              new_artist.save
              new_artist
            end
          end

   

    def print_songs
        puts @songs.collect {|song| song.name}

    end


end