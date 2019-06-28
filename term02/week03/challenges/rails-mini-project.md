# Rails Mini-Project

*Record Store*
You will have to get out of your bookstore and `rails new record-store` (or whatever you want to call it.

*Artists*

For the sake of this mini-app we are going to have the constraint be that an album only has one artist. We can expand on this in the future.
1. Use the rails utility command to create a model. (`rails g model ..`). This creates the model, but also sets up some of the columns (the `name:string` part sets up a 'name' column in the table with a datatype of 'string'). This model *won't have a foreign key in it, and no albums column - just the other information you want to have about your artist*.
*NB: All these commands will need to be googled. Have a go, and the worst that can happen is `rails new`.*
2. This sets up the active record model in your models folder, and creates the migration file. The migration file is the one that does the heavy lifting to create the `artists` table.
3. You need to run the migration (which creates the table). `> rails db:migrate`
4. That means that the table is set up inside the database. We will add more tables later.
5. Now use rails console (`> rails c`) to open up a porthole to the database. This is the place where we can make queries and look at the contents off our database. For example, punning a command like `Artist.all()` is us using the 'model' to check out the artists table within our database.
6. Inside here I want you to add three artists to the database. That has a few steps (the way we are doing nit now). a. Make a new activerecord instance `artist1 = Artist.new()`. b. Change the various attributes of that instance (title and author), and then c. Save the instance to the database (which is like adding a row to the table) `artist1.save`
7. I want the above process repeated 3+ times. *Exit the `rails c` (database world) before you run things like `> rails db:migrate` or `> rails db:seed`. These are commands that need to be run on the terminal. Only when you want to interact with the database should you be in the console (`> rails c`). Switching in and out of these places is confusing at first, but gets easier over time.*
8. That was the manual way to enter things into the database. We need to set up our `seeds.rb` file. Find that file.
9. Write up a ruby structure (an array of hashes is the most likely candidate) to hold some artist data that matches the database.
10. Put that ruby structure into the `seeds.rb` file. Then you need some ruby to loop through that array, and in the loop perform the same commands that you ran in the rails console. This will add those two artists that we had in our controller to the database, into the artists table. It's like adding two new rows to the table. (*We use a seeds file to give us some basic data to work with. The `seed.rb` file is ready to repopulate our db with some basic data should we need to restart the project, or drop the table due to a mistake, etc.*)
11. Check that you have added those artists by going back into the console, and getting back all the artists (the command is above in the earlier instructions).


*Albums*

1. Use the rails utility command to create a model. (`rails g model ..`). This creates the model, but also sets up some of the columns (the `name:string` part sets up a 'name' column in the table with a datatype of 'string'). This model *must have a foreign key that references the artists table*.
*NB: All these commands will need to be googled. Have a go, and the worst that can happen is `rails new`.*
2. This sets up the active record model in your models folder, and creates the migration file. The migration file is the one that does the heavy lifting to create the `albums` table.
3. You need to run the migration (which creates the table). `> rails db:migrate`
4. That means that the table is set up inside the database. We will add more tables later.
5. Now use rails console (`> rails c`) to open up a porthole to the database. This is the place where we can make queries and look at the contents off our database. For example, punning a command like `Album.all()` is us using the 'model' to check out the albums table within our database.
6. Inside here I want you to add three albums to the database. That has a few steps (the way we are doing it now), *and because we also need to tie the albums we make to an artist, we have a few more quirks. a. Make a new activerecord instance `album1 = Album.new()`. b. Change the various attributes of that instance (title and author), c. *make sure you are have an instance of an artist from the database ready to use as a reference for the foreign key* (`artist1 = Artist.find(4)` (for example) and then `album1.artist = artist1`. and then d. Save the instance to the database (which is like adding a row to the table) `album1.save`
7. I want the above process repeated 3+ times. *Exit the `rails c` (database world) before you run things like `> rails db:migrate` or `> rails db:seed`. These are commands that need to be run on the terminal. Only when you want to interact with the database should you be in the console (`> rails c`). Switching in and out of these places is confusing at first, but gets easier over time.*
8. That was the manual way to enter things into the database. We need to set up our `seeds.rb` file. Find that file.
9. Write up a ruby structure (an array of hashes is the most likely candidate) to hold some album data that matches the database. *Again, here you are going to have to think ahead, because you are going to need to have some artist instances (or at the very least some keys that reference artists) to use to assign to your albums as you make them*. You can either make them before you start adding albums, or pull them from the database.
10. Put that ruby structure into the `seeds.rb` file. Then you need some ruby to loop through that array, and in the loop perform the same commands that you ran in the rails console. This will add those two albums that we had in our controller to the database, into the albums table. It's like adding two new rows to the table. (*We use a seeds file to give us some basic data to work with. The `seed.rb` file is ready to repopulate our db with some basic data should we need to restart the project, or drop the table due to a mistake, etc.*)
11. Check that you have added those albums by going back into the console, and getting back all the albums (the command is above in the earlier instructions).


*The Models*

Hopefully you are quite comfortable now (bored even) with adding tables and data to tables, and creating seeds. We had the extra quirk here of needing to think a bit more carefully when adding albums, because those albums needed artists to be complete.
We also need to tell activerecord about this change.
1. Modify your `Album` model to contain the code `belongs_to :artist` (just inside the class)
2. and your 'Artist` model to have `has_many :books`.
3. These tell active record about the associations that we have made, and also mean that we can do a bit of fancy footwork in the console. So..
4. Open the console, and try this code `irb> Album.all.first.artist.name`
5. If that returns a value, your connections are in place, and you are on your way. If not, something might have gone wrong along the way. Let me know what issue you are having, and I will try to help out.

*Beast*

Now you have a table in your database (albums table) and you have added several albums to that database (several rows into the albums table). Go back through your app, and instead of using the in-memory database (that we were storing as `@@albums`), use the model to deal with the database. You will need to sometimes get all of the elements in the database, and sometimes get just one.

A few people were asking about the migration to create the foreign key.
This was the one that I used to make a migration and add a foreign key relating to the authors table in my books table:
`> rails g migration AddAuthorToBooks author:references`
Remember, this just creates the migration file, which looks like this:
````
class AddAuthorToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :author, foreign_key: true
  end
end
````
..which hopefully has code in it that is _reasonably_ self explanatory.
Then you have to.. yep.. `> rails db:migrate` which runs the task to have the change made to the structure of our books table. (We could write this file ourselves, and name it, and do all that, but it's easier to have it built by rails using rails's `rake` tasks.)