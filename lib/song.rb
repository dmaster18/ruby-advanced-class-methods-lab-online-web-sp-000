class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
   end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find do |song| 
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) 
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by do |song| 
      song.name
    end
  end
  
  def self.new_from_filename(file_name)
     song = self.new
     artist_and_song = file_name.split(/[-"]/)
     artist = artist_and_song[0].to_s.strip
     song.artist_name = artist
     song_name = artist_and_song[1].to_s
     song.name = song_name
     song
  end
  
  def self.create_from_filename(file_name)
    new_from_filename(file_name)
    save
  end

  
  def self.destroy_all
    @@all.clear
  end

  def self.save
    @@all << self.new
  end
end

i_dont = Song.new_from_filename("Aerosmith - I Don't Want to Miss A Thing.mp3")
puts i_dont.artist_name.class
puts i_dont.name.class



