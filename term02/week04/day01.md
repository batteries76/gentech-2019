# Day 01 — Rails

## Outcomes
- More SQL, including join tables
- Understanding join tables: why they help with many-to-many relationships
- How Active Record deals with complex table relationships

## SQL
- Rach has some awesome content for the SQL side. 
- I will write a summary of that here when I get a chance.

## The Limitations of Relational Databases, and the Solutions
- Today seemed to be a rough day. Rails already has a heap of things going on that are tricky to keep in mind all at once, and now there is more to add to that.
- We have discussed the routes (which hopefully make some sense from Sinatra), the controller (which handles the ruby code to marshall resources or views), and the views themselves (which are the visible dimentions sent to the browser). 
- The 'model' is the most mysterious character of the MVC set (at least for most people).
- But let's start at the start. Rails comes with a relational database, which means that the data is structured in tables.
- The main thing to understand about a table is that it is a rectangle. Sounds simple, but this concept is vital. When we choose a table to represent the data, we have to realise that every entry into that database is going to have the same attributes as every other entry.
- The main limitation this offers immediately to a dev is that there now is no such thing as an array within the database. Each table in the database is like a CSV - flat data. Each value relates directly to the heading - a series of simple hashes, if you will. 
- But the world isn't easily mapped into a table. Just adding more and more columns won't get the job done - and even if it could, as human devs we wouldn't be capable of making sense of it.
- We are beings that need categories, and luckily we have ways of using the tables in concert with our willingness to categorise the world.
- 

@channel I'm trying to write up some notes to explain today, but it's taking ages.
I think the biggest things to think about, the important elements are these:
- We have only flat tables (rectangles) to contain our data (like CSVs, which are like arrays of arrays in ruby terms)
- We have to find ways of grouping data (which comes down to a combination of the groupings that we would make using 'common sense', and then adding to that the _normalisation_ that Rachel ran through today.
- But then this is just a bunch of disconnected tables. The way we represent data in programming is always going to be an approximation (abstraction), but as we complicate our programming world, we are going to make connections between tables (and assumptions or business decisions). 
- If we use the well-worn example of 'authors' and 'books', we might start with an assumption (a book can only have one author), 