# gobc_5

This file contains the most recent version of GOBC which includes...

* Game
* Player
*  - NonPlayerCharacter
* GameActor
*  - Wanderer
*  - Gojira
*  - MagicCarpet
*  - Cthulhu

*Game* maintains a collection of players and game actors.

We have also implemented class variables and methods which manage the instance count of players and game actors.

We have implemented the check_game_actor_class_type method which checks each game actor's class to determine which behaviours are supported before calling them.

**Note the following...**

*"If it walks like a duck and it quacks like a duck, then it must be a duck"*

Have you heard of so-called *"duck-typing"*? Ruby uses the [responds.to?](https://ruby-doc.org/core-2.5.1/Object.html) method which is available to all objects, to determine whether an object supports a behaviour. The *make_flyers_land* method *"duck-types"* each game actor to determine whether it supports the *.land* bahviour.

# In this edition we continue the epic...

1. Rename the make_flyers_land method and call it duck_type_game_actors. 
2. Extend the method so that all game actors are duck-typed for their behaviours.
3. Call duck_type_game_actors to observe the results.