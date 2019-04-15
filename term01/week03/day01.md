## Things to go back to
- Combining booleans

<!-- ## Tomorrow
- Git
- Pseudocode
- Gems
- Case statements
- Ranges

## Week 4
- Class methods
- Inheritance
- Testing
- Blocks
- Modules

## Other
- Next test
- Kahoots -->

# Week 3, Day 1

## Object Oriented Programming (OOP)

Who here has heard of object oriented programming?

Who can explain what OOP (Object Oriented Programming) is?
OOP is a programming language paradigm that categorises pieces of code into logical self-contained objects. Uh……what? First off a programming paradigm is just a way or ‘style’ of programming. There are many different common paradigms out there and some programming languages make coding is certain ones easier than others. For example Ruby is known as an object oriented language not because we can’t use any other coding paradigm when writing Ruby code but because Ruby makes it very easy for us to follow that particular paradigm.

Object oriented programming is a lot like the way the world around us works which makes it a little easier to understand. Lets consider the world as a giant collection of objects.

Ask the class to name some objects found in the world 
Examples
* Card
* Shirt
* TV
* Computer

Now some of these objects are similar to each other and others are not. Lets take a look at different vehicles we have in the world.

What are some different kinds of vehicles?
* Truck
* Sports Car
* Van
* Car

All of these objects are fundamentally similar which why we can refer to all of them as vehicles. In programming similar objects belong to something called a class. Lets say that you drive a car but your friend drives a truck. Your friends truck is a vehicle but it isn’t a car. Both cars and trucks are similar but have clear differences. We would say that a car or truck is a subclass to the vehicle class. We can also refer to the vehicle class as the parent class and the car and truck classes as its children.

When we look at cars and trucks there are some characteristics and actions that are similar and some that are different. These characteristics are known as properties or attributes such as the color of the vehicle, how many wheels it has and what type of fuel it takes. The actions associated with these are also know as methods, like the vehicles ability to drive or turn it head lights on or off.

The main point of OOP is to take something that is complicated and simply it by breaking it down into pieces of code that are categorised into logical, self contained objects that are each responsible for their own defined set of tasks. What makes OOP really useful is that it gives us the ability to easily change specific objects within our program. For example we can change the color of a specific vehicle without effecting any other vehicle.

Lets now take a look at the building blocks of OOP, classes.

### Classes

A class is a definition for an object. All objects are created from classes and cannot exist without them. A class all of the information or details about an object. In OOP we can think of classes like a blueprint or a stamp. We use these to create multiple individual objects that are isolated and unique from one another. Let go back to our vehicle example. 

What is similar between all different types of vehicles?
* wheels
* color
* engine
* brakes
* ability to drive
* fuel

If we were going to make a vehicle it would be dumb to start from scratch every time since all vehicles share these properties and actions. Lets define our vehicle class to see the syntax.
class Vehicle
end

That is all it takes to define a class but at the moment its not very useful because it is empty. The thing to take note of is the capital letter for the class name. In Ruby it is required that you use a capital letter to define a class or else you will receive an error. Also when adding multiple words to a class name we use camel case instead of snake case. Lets make our class a little more useful by adding in some properties (attributes) that are available to each object also known as instance variables.
```ruby
class Vehicle
    def initialize    
        @engine = true
        @brakes = true
    end
end
```
We just added in two instance variables to our class. Notice how we had to use the @ character in front of the variable name. We also needed to define this an a initialize method. This is a very special method to ruby classes. Anytime we create an object from a class this method will automatically be ran. When we create an object we will have access to this data. Lets explore objects now and see how we can create one from a class.

### Objects

Remember a class is a blueprint or a stamp. We use a class to create objects that are each unique and self contained.

Go through the real world stamp example. Get a stamp and start stamping. Explain how each of these are different objects and we can modify each individually without effecting any other stamp or the stamper.

Ok so how do we do this in code?
```ruby
my_car = Vehicle.new
p my_car
```
We just created our first object! We get this really weird thing printed out the CLI though. What this is basically telling us is that we have an object associated to the vehicle class and then an identifier for that specific object.

Ok this is great but how do we get our data out of the object? Well instance variables are by default private and cannot be accessed from outside of its self. So how do we get around this because obviously we are going to need to know the data within our object. We can use methods! Lets use a method to access our engine instance variable.
```ruby
class Vehicle
    def initialize 
        @engine = true
        @brakes = true
    end

    def engine
        @engine
    end
end
```
Here we have a method named engine that returns our @engine instance variable. Now we can access our instance variable using this method. Lets see if it works.
```ruby
my_car = Vehicle.new
p my_car.engine
```
It works! A method that has the same name as the instance variable it returns is called a getter. We can also set instance variables with a method named a setter. This method is the same name as the instance variable with a equal sign added to the end.
```ruby
class Vehicle
    def initialize 
        @engine = true
        @brakes = true
    end

    def engine
        @engine
    end

    def engine=(value)
        @engine = value
    end
end
```
Awesome this method is referred to as a setter. You will hear the terminology getters and setters a lot in OOP. Lets use our setter to set our instance variable.
```ruby
my_car = Vehicle.new
p my_car.engine
my_car.engine = “vroom”
p my_car.engine
```
You can see that we get true printed to the CLI and then we get `“vroom”`. Instance variables are really cool because they belong to that specific instance of a class (object). Lets try creating two different object instantiated from the vehicle class and change their instance variables.
```ruby
my_car = Vehicle.new
your_car = Vehicle.new

my_car.engine = “v8”
your_car.engine = “v4”

p my_car.engine
p your_car.engine
```
They are different! That is because instance variables are associated to the object and not the class. Basically they get created at the time the object is created. But what if we want to set the value of some instance variables at the time of object instantiation? Well we can use the initialize method for that. Remember our initialize method is called immediately when an object is created. Lets set the color of our cars as they are created.
```ruby
class Vehicle
    def initialize(color)
        @engine = true
        @brakes = true
        @color = color
    end

    def engine
        @engine
    end


    def engine=(value)
        @engine = value
    end
end

Awesome! Lets create another car.
my_car = Vehicle.new “red”
p my_car.color
```
Oh no and error! 

Why did we get this error?
We don’t have a getter method defined yet in our class for our red instance variable.

Have the class define this instance variable.
```ruby
def color
    @color
end
```
Now that this method is defined in our class we can access our cars color.
```ruby
my_car = Vehicle.new “red”
p my_car.red
```
Lets create 3 different cars of different colors.
```ruby
car_1 = Vehicle.new “red”
car_2 = Vehicle.new “blue”
car_3 = Vehicle.new “green”

p car_1.color
p car_2.color
p car_3.color
```
This is freaking cool! Each of our objects now has a instance variable holding a different value for color. We can do this for as many instance variables as we want.
```ruby
class Vehicle
    def initialize(color, fuel_type)
        @engine = true
        @brakes = true
        @color = color
        @fuel_type = fuel_type
    end

    def fuel_type
        @fuel_type
    end

    def color
        @color
    end

    def engine
        @engine
    end

    def engine=(value)
        @engine = value
    end
end

car_1 = Vehicle.new “red”, “diesel”
p car_1.color, car_1.fuel_type
```
### Attribute Accessors

As you have seen because Ruby by default makes all of our instance variables private we need to create a getter and setter method for each instance variable we want access to or to be able to edit. But what if we had five different ones well that would equal ten methods that seems like it would get tiring to write. What about if we had ten or twenty or thirty. That would be sixty different methods! There has got to be a better way right?

Well the good folks at Ruby saw this problem and gave us a way to define these methods easier. They are called attribute accessors and its just shorthand for what we have already been doing. Lets replace our engine getter and setter method with an attribute accessor.
```ruby
class Vehicle
    attr_accessor :engine

    def initialize(color, fuel_type)
        @engine = true
        @brakes = true
        @color = color
        @fuel_type = fuel_type 
    end

    def fuel_type
        @fuel_type
    end    

    def color
        @color
    end
end

car_1 = Vehicle.new "red", "diesel"
p car_1.engine
```
Notice how we removed the engine method but we were still able to get the value of the engine instance variable. That is because in the background a attribute accessor is creating both the getter and setter method for us! We can even do for multiple instance variables.
```ruby
class Vehicle
    attr_accessor :engine, :fuel_type, :color

    def initialize(color, fuel_type)
        @engine = true
        @brakes = true
        @color = color
        @fuel_type = fuel_type
    end
end

car_1 = Vehicle.new “red”, “diesel”
p car_1.color
p car_1.fuel_type = “petrol”
p car_1.fuel_type
```
How awesome is this! But what if we only want a method of a single kind for instance we only want the getter method for a certain instance variable and not the setter. Well Ruby has an accessor for that!
```ruby
attr_reader :brakes
```
Now we can only read the value of the brakes instance variable. We cannot set it.
```ruby
car_1 = Vehicle.new “red”, “diesel”
p car_1.brakes
car_1.brakes = false
```
We see true printed to the CLI but we then get an undefined method error. That’s because we do not have a defined setter for that instance variable on this class.

The reverse of this is what if we only want a setter for an instance variable and not a getter. Well we could use this:
```ruby
attr_writer
```
The reason we are using `attr_reader` and `attr_writer` is because that a reader and writer are simply another name for a getter and setter.
