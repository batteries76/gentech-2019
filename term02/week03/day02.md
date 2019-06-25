# Day 02 — SQL and Models

## Outcomes
- Understand some basics of SQL
- Understand more fully the basic CRUD operations of Rails
- Get a first look at models in Rails

## SQL
- Content coming soon.

## Storage and Databases
- We have been using a CSV to store persistent data.
- We program in ruby, so a CSV needs processing (parsing) before we can use it.
- Now we are stepping things up and using a real database - but the concept is the same.
- The db we are using is Postgres (or SQLite, which is the same flavour), and this is a relational database.
- That means that it is based in the concept of *tables* (which are very similar to a CSVs).
- But our database is now more powerful, and can contain many tables (which would be like having many CSVs).
- And they can do much more than a CSV can, but we'll get to that in time.

## Migrations and Models in Rails 
- *Migrations* are the way we set up structure in our database.
- We use migrations to create the tables themselves, and to configure the columns in that table.
- The *model* is the helper that deals with the data *_in_* the tables.
- It run the SQL commands so that we don't have to, and turns the responses into ruby so that we can get on with programming in a language we understand.
- We created a `Book` model to help us to add a row to our books table, or delete a row, or to find out what is in the table. Basically our *Book model* is what will deal with everything we need to worry about with our *book table*.
- If we were to create an author model, it would relate to the author table.
- The model helps us to do all the CRUD operations that we have been doing in ruby (or in our CSV).
- The rails migrations help to set the structure (the tables and the columns in those tables) that those CRUD operations act within.

## Rails Console, and the Seed File
- Rails console (`> rails c`) is a pry/IRB environment where we have access to the model. 
- You can think of this as a world where we can use our model to interact with the database.
- (Be sure to exit out of here to return to terminal and perform Rails tasks, like `> rails db:seed`.)
- In here we can do all the normal operations that we might need to do regarding a database, and we can use the model to perform those operations.
- The `seed.rb` file is used to dummy up some basic data so that we can run our app with some live data.
- Once we have our model set up, we can now also use it to interrogate the db in our controllers.
- (You can hopefully now see that the controllers are like mission control. They deal with the incoming requests routed to them. They might chat with the model. They might run some ruby logic. They marshall the correct response to the browser, or send redirect to another method. They are the lynchpin of the Rails app.)

- Here are the steps of the challenge from today. They might be worth repeating with a different model:
1. Use the rails utility command to create a model. (`rails g model ..`). This creates the model, but also sets up some of the columns (the `name:string` part sets up a 'name' column in the table with a datatype of 'string').
2. This sets up the active record model in your models folder, and creates the migration file. The migration file is the one that does the heavy lifting to create the `books` table.
3. You need to run the migration (which creates the table). `> rails db:migrate`
4. That means that the table is set up inside the database. We will add more tables later.
5. Now use rails console (`> rails c`) to open up a porthole to the database. This is the place where we can make queries and look at the contents off our database. For example, punning a command like `Book.all()` is us using the 'model' to check out the books table within our database.
6. Inside here I want you to add three books to the database. That has a few steps (the way we are doing nit now). a. Make a new activerecord instance `book1 = Book.new()`. b. Change the various attributes of that instance (title and author), and then c. Save the instance to the database (which is like adding a row to the table) `book1.save`
7. I want the above process repeated 3+ times. *Exit the `rails c` (database world) before you run things like `> rails db:migrate` or `> rails db:seed`. These are commands that need to be run on the terminal. Only when you want to interact with the database should you be in the console (`> rails c`). Switching in and out of these places is confusing at first, but gets easier over time.*
8. That was the manual way to enter things into the database. We need to set up our `seeds.rb` file. Find that file.
9. Get the content that we were using as a database out of the controller (the `@@books = [..`)
10. Put that content into the `seeds.rb` file. Then you need some ruby to loop through that array, and in the loop perform the same commands that you ran in the rails console. This will add those two books that we had in our controller to the database, into the books table. It's like adding two new rows to the table. (*We use a seeds file to give us some basic data to work with. The `seed.rb` file is ready to repopulate our db with some basic data should we need to restart the project, or drop the table due to a mistake, etc.*)
11. Check that you have added those books by going back into the console, and getting back all the books (the command is above in the earlier instructions).
*Beast*
12. Now you have a table in your database (books table) and you have added several books to that database (several rows into the books table). Go back through your app, and instead of using the in-memory database (that we were storing as `@@books`), use the model to deal with the database. You will need to sometimes get all of the elements in the database, and sometimes get just one.
13. Finish the above including adding a new book, and deleting a book.
14. Clean up the app so that it links nicely.