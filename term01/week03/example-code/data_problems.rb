class Artist
    attr_accessor(:name)
    attr_reader(:albums)
    def initialize(name)
        @name = name
        @albums = []
    end
    def add_album(album)
        @albums << album
    end
end 

class Album
    def initialize(name)
        @name = name
    end
end

# beatles = Artist.new("The Beatles")
# beatles.sleep()
# sgt = Album.new("Seargent Peppers")

# puts(beatles.albums)
# beatles.add_album(sgt)
class Thing
    attr_reader(:zzz, :yyy)
    def initialize()
        @zzz = "This"
        @yyy = "That"
    end 
    def change_anything(attribute, value)
        self.instance_variables.each do |attr|
            attr_s = attr.to_s
            print("This is attr_s in change_anything loop: #{attr_s}")
            puts
            if(attr_s = attribute)
                puts("In HERE")
                self.(attr_s.to_sym) = value
            end
        end
    end
end

a = Thing.new()

a.change_anything("@yyy", "else")
puts(a.yyy)
