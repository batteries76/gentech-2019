# Flippin' traffic lights challenge

Read on...

The TrafficLight class has a single attribute **isGreen** which stores true or false and...
- constructor takes a single argument which initialises the isGreen attribute.
- read and write access to isGreen.
- override to_string

The Road class has a single attribute which is a list (array, hash, up to you) of TrafficLight(s).
- constructor initialises the list with 10 TrafficLight(s) which have randomly generated boolean values for isGreen.
- contains a method called **change_lights** which flips the value of all traffic lights in the list.
- contains a method called get_traffic_lights, which takes a single argument, and returns the TrafficLight at the given position in the list. If the argument exceeds to the positions in the list, nil should be returned.
- read access to list of traffic lights.
- override to_string.

The Main class...
- creates an instance of Road.
- gets and prints at least 3 traffic lights (from Road).
- prints all traffic lights.
- flips the value of all traffic lights (through Road).
- counts the number of green traffic lights.
- counts the number of read traffic lights.
