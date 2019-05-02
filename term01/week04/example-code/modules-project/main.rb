require_relative './animals.rb'
require_relative './constants.rb'
require_relative './methods.rb'
require 'catpix'

Catpix::print_image "kuhn-copy.jpg",
  :limit_x => 1.0,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => true,
  :resolution => "high"

menu = MyMathsConstants::MENU

tigger = Tiger.new()
puts tigger

puts(MyMathsConstants::PI)

Keepers.working()

k1 = Keeper = Keepers::Keeper.new() 

puts(k1)

puts(Keepers::MAX_STAFF)

gerald = Zebra.new()
puts(gerald)