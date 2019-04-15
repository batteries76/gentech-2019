# To run this:
# > gem install yield_source
# Run the file. 
# It will break. 
# Your job is to fix it.
require 'yield_source'

# This will break. Make it work. You need to find a string that says "Found me.."
what_the_dooce!()

# Build an object. We will use this object by running its instance methods
yield_obj = YieldSource.new()

# Here you have the starter code.. but need to investigate what's going on. 
# yield_obj.what_is_it?() do |thing|
# end

# This takes a block, but also two ordinary number arguments in the instance method. See if you can use the block to work out what happens before the yield.
# yield_obj.yielder()
# end

# This one takes a string (and a block). What is happening behind the scenes?
# yield_obj.how_many()
# end 

# This one takes a string again (and a block as usual).  
# yield_obj.what_is_it_this_time()
# end

# Yep, a string and a block again. But something else is going on here. See if you can discover it. (You'll need to do a good job investigating the pipes.)
# yield_obj.argsss()
# end

# This one takes an array. What it is up to?
# yield_obj.now_what()

# This one takes a sentence and does summat
# yield_obj.str_to_what()