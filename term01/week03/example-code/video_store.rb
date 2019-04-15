require 'pry'

class VideoStore
    attr_accessor(:films, :name)
    def initialize(name)
        @name = name
        @films = []
    end
    def add_film(*films)
        films.each do |film|
            @films << film
        end
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

class Actor
    attr_accessor(:name, :age)
    def initialize(name, age)
        @name = name
        @age = age
    end
end

blockbuster = VideoStore.new("Blockbuster")
vid_ezy = VideoStore.new("Video Ezy")

ghd = Film.new("Groundhog Day")
it = Film.new("IT")
up = Film.new("Up")

bill_m = Actor.new("Bill Murray", 68)
andie_m = Actor.new("Andie MacDowell", 60)
chris_e = Actor.new("Chris Elliott", 58)

wows = Film.new("Wolf of Wall Street")

leo = Actor.new("Leonardo DiCaprio", 44)
margot_r = Actor.new("Margot Robbie", 28)

vid_ezy.add_film(wows)

wows.add_actor(leo)
wows.add_actor(margot_r)

blockbuster.add_film(ghd)
blockbuster.add_film(it)
blockbuster.add_film(up)

ghd.add_actor(bill_m)
ghd.add_actor(andie_m)
ghd.add_actor(chris_e)

# print(blockbuster.films)
# puts

# binding.pry

class Array
    def my_each(num)
        counter = 0
        # print("self is #{self}")
        # puts
        while(counter < self.length)
            # puts("In while before yield")
            yield(self[counter] * num)
            # puts("In while after yield")
            counter += 1
        end
    end
end

arr = [5,2,4]

arr.my_each(4) do |item|
    puts item
end


