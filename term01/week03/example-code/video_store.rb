class VideoStore
    attr_accessor(:films, :name)
    def initialize(name)
        @name = name
        @films = []
    end
    def add_film(film)
        @films << film
    end
end

class Film 
    attr_accessor(:actors, :title)
    def initialize(title)
        @title = title
        @actors = []
    end
    def add_actor(actor)
        @actors << actor
    end
end

blockbuster = VideoStore.new("Blockbuster")
ghd = Film.new("Groundhog Day")
it = Film.new("IT")
up = Film.new("Up")

blockbuster.add_film(ghd)
blockbuster.add_film(it)
blockbuster.add_film(up)
print(blockbuster.films)
puts