# Databases and Design

<br>

## What are we learning?

* The characteristics of a Relational Database.
* Data normalisation.
* Keys and Relations.
* Familiarity with Structured Query Language (SQL).

<br>

# What is a database?
Any store of information, some simple examples include...

* A written shopping list
* An excel spreadsheet

...and of course...

* A stored collection of related tables of data.

More specifically, the data in a database is organised into *columns* and *rows* - each column represents a data field and each row is a record made up of fields.

<br>

# What is a Relational Database Management System (RDBMS)?
Software which allows *related* data to be organised and stored together in *tables*.

Some popular RDBMS include:

* [Postgres](https://www.postgresql.org/docs/11/index.html)
* [MySQL](https://www.mysql.com/)
* [MSSQL Server](https://www.microsoft.com/en-au/sql-server/sql-server-2017?&OCID=AID739528_SEM_A0BeQIx9&MarinID=sA0BeQIx9_324813226497_ms%20sql%20server_e_c__65379009752_kwd-18195826_)
* [Oracle](https://www.oracle.com/au/database/)
* [SQLite](https://www.sqlite.org/index.html)

<br>

# Why use a database?

Databases provide data *persistence* for the data used and produced by our applications.

A database server may be hosted locally or remotely.

Remotely hosted databases are used to serve data across networks, and, depending on the product and architecture, may support thousands of *concurrent* connections.

<br>

# Relational

For example, a store might have the following tables in their database...

* product categories
* products
* customers
* orders

We can see that these tables might be related - but *how* does database design achieve the relationships?

Let's say our client is using a spreadsheet to maintain their product inventory. They have given us the spreadsheet file so that we can start designing the database.

First 7 rows from **the spreadsheet**...
````
category   |    name    | price
-----------+------------+------------+-------
Fresh     | Watermelon |  2.50
Frozen    | Icecream   |  4.00
Shelf     | Rice       |  1.00
Fresh     | Mango      |  3.50
Shelf     | Tea        |  2.50
Shelf     | Coffee     |  3.00
Frozen    | Sorbet     |  6.50
````

There are 3 columns/fields and 7 rows/records.

The first thing we want to do is *normalise* the data. We start this process by moving duplicate *category* data into its own table which can be referenced by the product records, which now live in their own table.

**categories**
````
categoryid |  name
------------+--------
       1 | fresh
       2 | frozen
       3 | shelf
````

**products**
````
productid | categoryid |    name    | price
----------+------------+------------+-------
       1 |          1 | Watermelon |  2.50
       2 |          2 | Icecream   |  4.00
       3 |          3 | Rice       |  1.00
       4 |          1 | Mango      |  3.50
       5 |          3 | Tea        |  2.50
       6 |          3 | Coffee     |  3.00
       7 |          2 | Sorbet     |  6.50
````

Notice that each table has an id column, and that category names are no longer repeated - anywhere. Instead, the product table maintains a reference to the id of the category name.

We are now well on our way to *normalising* the data.

# Normalisation

Data [normalisation](https://www.techopedia.com/definition/1221/normalization) is the process of optimising the way that data is organised and stored. This provides optimisation for data storage and efficiencies for *querying* the records.

The stages of the normalisation process achieve data in *first, second and third normal forms*.

<br>

## First normal form (1NF)

The first step is to organise the data into [First Normal Form (1NF)](https://www.tutorialspoint.com/sql/first-normal-form.htm).

* Define the columns and their data types.
* Repeating data is extracted into its own table.
* Create **primary keys** (id's) for each table - this defines a column as the unique identifier for each record.
* Use **foreign keys** (id's) to provide relationships (links) between tables - this defines a field which is the primary key of another table.

<br>

Here are our tables, again, which include primary key, foreign key and general data types (specific data types are RDBMS dependant).

**categories 1NF**
````
(PK) categoryid (number) |  name (string)
-------------------------+--------
                 1      | fresh
       ....................
````

**products 1NF**
````
(PK) productid (number) | (FK) categoryid (number) |    name (string)    | price (number)
-------------------------+--------------------------+---------------------+-------
                     1 |                        1 |          Watermelon |  2.50
            ..........

````

## Second normal form (2NF)

To achieve second normal form...

* Data is in 1NF.
* Columns which are not *functionally dependent* on the primary key should be removed into their own table.

In another example, consider the following *students* table which is currently in 1NF...

````
(PK) studentid | studentname     | professorid  | professorname
----------------+-----------------+--------------+--------------
            1 | Rachael         | 101          |  Prof. Gordon
            2 | Matt            | 402          |  Prof. White
            3 | Gretchen        | 222          |  Prof. Barry
            4 | Harrison        | 676          |  Prof. Keen
````

Is the data related to the professor *functionally dependant* on the primary key of the table (studentid)? Another way to put it..

*"If Rachael dropped-out, and her student record was deleted, do we care that the professor data would be lost?"*

If the answer to this question is *yes*, remove the professor data into a table relation and provide a reference (in the students table) to the primary key of the new table, as shown...

**students table 2NF**
````
(PK) studentid | studentname     | professorid (FK)
----------------+-----------------+------------
            1 | Rachael         | 101      
            2 | Matt            | 402      
            3 | Gretchen        | 222      
            4 | Harrison        | 676      
````
<br>

**Professor table 2NF**
````
(PK) professorid | professorname
------------------+--------------
          101   | Prof. Gordon
          402   | Prof. White
          222   | Prof. Barry
          676   | Prof. Keen
````

<br>

## Third normal form (3NF)

To achieve third normal form...

* Data is in 2NF
* Columns which are not dependant on the primary key, and which are dependant on another column, should be removed into their own table.

In the next example, consider the following *clients* table which is currently in 2NF...

````
(PK) clientid | clientname    | addressline1  | addressline2   | postcode
----------------+---------------+---------------+----------------+---------
            1 | R.Colley      | 1 Happy lane  |  Happyville    | 3001
            2 | M.Mckenzie    | 40 Hop place  |  Hop Town      | 3300
            3 | G.Scott       | 25 Hom street |  Hom Rise      | 3050
            4 | H.Malone      | 18 Todd lane  |  Toddsville    | 3030
````

The set of columns representing the client's address are dependant on each other, in order to represent a complete address. For this reason, the table is not yet in 3NF.

Let's remove the address data into a table relation...

**clients table 3NF**
````
(PK) clientid | clientname     addressid
----------------+--------------+-------------
            1 | R.Colley      | 1
            2 | M.Mckenzie    | 2
            3 | G.Scott       | 3
            4 | H.Malone      | 4
````

**clientaddress table 3NF**
````
(PK) clientaddressid | addressline1  | addressline2   | postcode
-----------------------+---------------+----------------+---------
                   1 | 1 Happy lane  |  Happyville    | 3001
                   2 | 40 Hop place  |  Hop Town      | 3300
                   3 | 25 Hom street |  Hom Rise      | 3050
                   4 | 18 Todd lane  |  Toddsville    | 3030
````

<br>

# Table relations

Let's have a closer look at keys...

**What is a Key?**

A *key* defines a special field or collection of fields belonging to a table.

* **Primary Key** Defines a field as the unique identifier for each record.
* **Foreign Key** Defines a field which is the primary key of another table.

There are others but we will discuss a simple relationship using primary and foreign keys here.

Consider these 2 tables...

**categories**
````
categoryid |  name
------------+--------
        1 | fresh
        2 | frozen
        3 | shelf
````

**products**
````
productid | categoryid |    name    | price
----------+------------+------------+-------
       1 |          1 | Watermelon |  2.50
       2 |          2 | Icecream   |  4.00
       3 |          3 | Rice       |  1.00
       4 |          1 | Mango      |  3.50
       5 |          3 | Tea        |  2.50
       6 |          3 | Coffee     |  3.00
       7 |          2 | Sorbet     |  6.50
````

Notice that each table has a unique id (*categoryid, productid*). These are **primary keys** (you will see the syntax for implementing these shortly).

Can you see how these tables are *related*?

Note that each product is *related* to its category via the **categoryid** field. This means that the *categories.categoryid* field is also a **foreign key* in the products table.

There may be many tables in a database, with many relationships.

<br>

## What is Structured Query Language (SQL)?

[Structured Query Language (SQL)](https://www.w3schools.com/sql/default.asp) is the language we use to speak to a database.

There is some variation in how it is used with various products but the basics of performing **Create, Read, Update and Delete (CRUD)** operations tend to be the same.

Here's a SQL syntax example where we *query* the products table to get a copy of all fields of all records.

````SQL
SELECT * FROM products;
````

We will be seeing lots of SQL in the next section...

<br>

Your turn...

<hr>

# :trophy: Challenge - Normalise this

**XYZ Widgets** have asked you to create a database for them. They have provided you with their flat file database (spreadsheet) which contains their current inventory of widgets.

Using your new powers of relational database design...


1. [Download the spreadsheet](xyz-widgets-inventory-challenge-data.xlsx).
2. Organise the structure and data into 1NF.
3. Organise the structure and data into 2NF.
4. Organise the structure and data into 3NF.

You may use a tool of your choice to complete this challenge. Hold on to your solution for the next challenge!

<br>

<hr>

*rachael.colley<span></span>@coderacademy.edu.au Last updated July 28, 2018*

<hr>





