
class Dog

    attr_reader(:legs_count)
    # attr_writer(:this_dogs_name)
    attr_accessor(:this_dogs_name, :tail_count)

    def initialize(name)
        # @owner = owner
        @this_dogs_name = name
        @tail_count = 1
        @legs_count = 4
        @ears
    end

    def speak()
        puts("#{@this_dogs_name} says woof woof")
    end

    # def legs_count()
    #     return @legs_count
    # end

    # def this_dogs_name()
    #     return @this_dogs_name
    # end

    # def change_name(name)
    #     @this_dogs_name = name
    # end
end

dog1 = Dog.new("Oreo")
puts(dog1)
puts(dog1.legs_count())
# puts(dog1.this_dogs_name())

chunk = Dog.new("Chunk")
# puts(chunk.this_dogs_name())

dog3 = Dog.new("Che")
dog4 = Dog.new("Pat")
# puts(dog4.this_dogs_name)
dog4.this_dogs_name = "Owen"
puts(dog4.this_dogs_name)
puts(dog3.tail_count)
dog1.speak()
dog1.speak()
chunk.speak()
dog4.speak()





# arr1 = [1,2,3]
# # arr1 = Array.new(1,2,3)
# arr1.each do |item|





class House
    def initialize()
    end
end

house1 = House.new()
h2 = House.new()
h3 = House.new()
