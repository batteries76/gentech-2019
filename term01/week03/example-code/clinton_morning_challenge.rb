# Create three classes: Artist, Album and Song

# # Artist class
# 1. Artist class has two attributes: name and albums, the albums attribute will be an array of album objects
# 2. The Artist class will also have an instance method that will allow to add album objects to the albums attribute
# 3. Create two instances of the Artist class
# Hint: you may need to initialize the albums attribute as an empty array

class Artist 
    attr_accessor(:name, :albums)

    def initialize(name)
        @name = name
        @albums = [] 
    end

    def add_album(album)
        @albums << album
    end 

    def to_s()
        puts ("#{@name} Discography: #{@albums}")
    end

    def count_albums()
        if @albums.length > 1
    puts ("#{@name} has #{@albums.length} albums")
        else    
            puts ("#{@name} has #{@albums.length} album")
        end 
    end
end


# # Album class
# 4. Similarly, the Album class will have a title, release_date and songs array and an instance method to add song objects to the songs attrtibute
# 5. Create at least three instances of the Album class
# 6. Use the instance method defined in the Artist class to add these album objects in the Artist instances created above.

class Album
    attr_accessor(:title, :release_date, :songs)

    def initialize(title, release_date)
        @title = title
        @release_date = release_date
        @songs = []
    end

    def add_song(song)
        @songs << song
    end
    def count_songs()
        if @songs.length > 1
    puts ("#{@title} has #{@songs.length} songs")
        else    
            puts ("#{@title} has #{@songs.length} song")
        end 
    end
end

# # Song class
# 7. The Song class will have title, duration and genre
# 8. Create at least three instances of the Song class
# 9. Use the instance method defined in the Album class to add these song objects in the Album instances created above.

class Song
    attr_accessor(:title, :duration, :genre)

    def initialize(title, duration, genre)
        @title = title
        @duration = duration
        @genre = genre
    end
end

class Billboard
    attr_accessor(:artists)

    def initialize()
       @artists = []
    end

    def add_artist(artist)
        @artists << artist
    end

    def count_artists()
        puts ("There are currently #{@artists.length} artists in the Billboard charts")
    end
end

#Artists
billboard = Billboard.new()

dforce = Artist.new("Dragonforce")
heat = Artist.new("H.E.A.T")

billboard.add_artist(dforce)
billboard.add_artist(heat)

billboard.count_artists
puts

#Albums
ir = Album.new("Inhuman Rampage", 2005)
pw = Album.new("The Power Within", 2012)
tdtw = Album.new("Tearing Down the Walls", 2014)
dforce.add_album(ir)
dforce.add_album(pw)
heat.add_album(tdtw)

#Songs
ttfatf = Song.new("Through the fire and the flames", 7.21, "Power metal")
ir.add_song(ttfatf)
rds = Song.new("Revolution Deathsquad", 7.54, "Power metal")
ir.add_song(rds)
sbf = Song.new("Storming through the burning fields", 5.19, "Power metal")
ir.add_song(sbf)
sbf = Song.new("Storming through the burning fields", 5.19, "Power metal")
ir.add_song(sbf)

ho = Song.new("Holding on", 4.56, "Power metal")
pw.add_song(ho)
fw = Song.new("Fallen World", 4.09, "Power metal")
pw.add_song(fw)


ponr = Song.new("Point of no return", 5.17, "Power metal")
tdtw.add_song(ponr)
inferno = Song.new("Inferno", 3.45, "Power metal")
tdtw.add_song(inferno)

dforce.to_s
puts
heat.to_s
puts
dforce.count_albums
puts
ir.count_songs
puts
pw.count_songs
puts
heat.count_albums
puts
tdtw.count_songs
puts


# Beast
# 10. create a method in the Artist class that will count how many albums that artist instance has
# 11. create a method in the Album class that will count how many songs that album instance has

# Beast ++
# 12. Create a Billboard class and define a method in there which will count how many instances of the Artist class have been created