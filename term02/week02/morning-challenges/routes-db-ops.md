# DB ops and routes challenge

We have been discussing the different HTTP verbs (POST, DELETE, etc). These have analogs relating to database changes. Those actions take the delightful acronym **CRUD**. These are *C*reate (make a new entry), *R*ead (find a particular entry), *U*pdate (change one or more values in an existing entry), and *D*elete (destroy an entry).

1. Take the dataset below, and using either your CSV parser or ruby's CSV library, start creating some methods to perform these actions on that dataset.
2. Wrap these methods in a class or a module.

*Beast*
3. Start to integrate these methods into your Sinatra app.

Data...

````
id,team,city,premierships
1,collingwood,melbourne,15
2,west coast,perth,4
3,brisbane,brisbane,3
4,gws,sydney,0
5,north melbourne,melbourne,4
6,carlton,melbourne,16
7,sydney,sydney,5
8,melbourne,melbourne,12
9,western bulldogs,melbourne,2
10,fremantle,perth,0
11,gold coast,gold coast,0
12,adelaide,adelaide,2
13,essendon,melbourne,16
14,richmond,melbourne,11
15,geelong,geelong,9
16,hawthorn,melbourne,13
17,st kilda,melbourne,1
18,port adelaide,adelaide,1
````