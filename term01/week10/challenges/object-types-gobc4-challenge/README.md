# gobc_4

This file contains the most recent version of GOBC which includes...

* Game
* Player
*  - NonPlayerCharacter
* GameActor
*  - Wanderer
*  - Gojira
*  - MagicCarpet

Game maintains a collection of players and game actors.

We have also implemented class variables and methods which manage the instance count of players and game actors.

* Note the following... *

In the previous version you were asked to call the .land behaviour on all GameActor instances in the game, and to observe this fail. This has been implemented in the try_to_make_all_flyers_land method, which is commented out further down. Why does it fail?

Each class now resides within it's own .rb file and is 'required' by the statements at the top of the (*main.rb*) file.

The check_game_actor_class_type method uses object's [is_a?](https://ruby-doc.org/core-2.5.1/Object.html#method-i-is_a-3F) method to determine if the object's class is MagicCarpet. This allows us to safely check the object's class before calling behaviours on it.

# In this edition we continue the epic...

## Cthulhu https://en.wikipedia.org/wiki/Cthulhu
1. Cthulhu is a game actor who can stroll, powerwalk, dive, blow bubbles, surface, take-off, cruise and land.
2. Define the Cthulhu class along with the behaviours mentioned. Implement these methods so that they simply return a string which echos the current behaviour name.
3. Create 2 Cthulhu instances and add them to the game.
4. Expand the check_game_actor_class_type method so that the stroll, powerwalk, blow bubbles, dive deep, surface, take-off, cruise and land behaviours are called only on game actors which support those behaviours.
5. Get the game actors from the game and pass them to both methods to the check_game_actor_class_type. Observe the results.