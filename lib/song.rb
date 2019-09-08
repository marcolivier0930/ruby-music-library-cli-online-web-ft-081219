class Song 
   extend Concerns::Findable
   
   attr_accessor :name, :artist, :genre 
   
   @@all = []
   
   def initialize(name, artist = nil, genre = nil)
     @name = name 
     self.artist = artist if artist
     self.genre = genre if genre
     save
   end
   
   def self.all
     @@all
   end
 
   def self.destroy_all
     @@all.clear
   end
   
   def save
     @@all << self
   end
   
   
   def self.create(name)
     self.new(name)
   end
   
   def add_song(song)
     song.artist = self unless song.artist == self 
     @song << song unless @song.include?(song)
   end
   
   def genre=(genre)
     if @genre == nil
       @genre = genre
     else
       @genre= @genre
     end
     if self.genre != nil
       @genre.add_song(self)
     end
     @genre
   end
   
   def artist=(artist)
    if @artist == nil 
      @artist = artist
    else
      @artist = @artist 
    end
    
    if self.artist != nil 
      @artist.add_song(self) 
    end
    @artist 
   end
   
   def self.new_from_filename(name)
        #parse the filename
        song_name = name.split(" - ")[1]
        artist_name = name.split(" - ")[0]
        genre_name = name.split(" - ")[2].chomp(".mp3")

        song = self.find_or_create_by_name(song_name)
       
        song.artist = Artist.find_or_create_by_name(artist_name)
    
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
   end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end
   
   
 end