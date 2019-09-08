# class MusicImporter
# 
#   def initialize(path)
#     @path = path
#   end
# 
#   def path
#     @path
#   end
# 
#   def files()
#     @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
#   end
# 
#   def import()
#     files.each do |filename|
#       Song.create_from_filename(filename)
#     end
#   end
# 
# end# 

require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each {|file| Song.create_from_filename(file) }
  end


end