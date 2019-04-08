require 'pry'

class Car
    attr_reader(:wheels, :cylinders, :make, :aircon_running)
    # attr_writer(:colour)
    attr_accessor(:colour, :aircon, :top_speed)
    def initialize(colour, cylinders, aircon, make, top_speed)
        @colour = colour
        @cylinders = cylinders
        @aircon = aircon 
        @make = make
        @wheels = 4
        @top_speed = top_speed
        @current_speed = 0
        @aircon_running = false
    end

    def set_current_speed(speed)
        @current_speed = speed
    end

    def toggle_aircon()
        if(@aircon_running)
            @aircon_running = false
        else 
            @aircon_running = true
        end
    end

    def how_far_from_top_speed()
        return @top_speed - @current_speed
    end

end

car1 = Car.new('blue', 4, true, 'Honda', 150)
puts(car1)
car2 = Car.new('green', 6, true, 'Kia', 180)
puts(car2)

puts(car2.colour)
puts(car1.colour)

car2.colour = 'red'
puts(car2.colour)

car2.set_current_speed(60)

puts("car 1 aircon: #{car1.aircon_running}")
car1.toggle_aircon()
puts("car 1 aircon: #{car1.aircon_running}")
car1.toggle_aircon()
puts("car 2 aircon: #{car2.aircon_running}")
puts("car 1 aircon: #{car1.aircon_running}")

speed_remaining = car2.how_far_from_top_speed()
puts("You could go #{speed_remaining} faster")

# binding.pry

# def init(*x)
#     print("the arguments are #{x}")
#     puts
# end

# init()
# init(4,5,6,7)
# init(2)

# arr = [1,2,3]
# arr = Array.new(1,2,3)

# class Array
#     def each()
#         while()
#         end
#     end
# end