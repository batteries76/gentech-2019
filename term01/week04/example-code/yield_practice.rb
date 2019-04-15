require 'yield_source'

what_the_dooce!() do |item|
    puts item
end

yield_obj = YieldSource.new()

yield_obj.what_is_it?() do |item|
    puts item 
end

yield_obj.yielder(2, 7) do |thing|
    puts thing
end
puts
yield_obj.how_many("eeettttttteggghghgeghghghghgeghghghghghghe") do |what|
    puts what
end
puts
yield_obj.what_is_it_this_time("sfsffsfffsffffsfffffsffffffs") do |num|
    print num.to_s + " then "
end
puts
yield_obj.argsss("n nb nbnb nbnbnbnb nb nbnb nb b") do |a,b|
    puts "#{a} #{b}"
end
puts
yield_obj.argsss("n nb nbnb nbnbnbnb nb nbnb nb b") do |*args|
    print args
    puts
end

yield_obj.now_what(["a","b", "c"]) do |item|
    puts item
end

yield_obj.str_to_what("This is a big sentence that has lots of words in") do |hash|
    print hash
    puts
end
