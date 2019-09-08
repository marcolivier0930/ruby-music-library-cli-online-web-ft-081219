 class Song 
   
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
     self.new(name).tap do|song|
       song.save
     end
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
   
   def find_by_name
     
   end
   
 end