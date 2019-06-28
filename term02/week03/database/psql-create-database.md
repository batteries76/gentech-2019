# Creating a Postgres database with the psql utility

In this discussion we will create a database on our local Postgres server.

The database will contain a single table called **widget**.

<br>

[psql](http://postgresguide.com/utilities/psql.html) is a shell utility for Postgres. There are also visual tools that we will use later.

Ensure that you have installed and configured Postgres, before proceeding...

````
postgres --version
````

...which should return a message similar to...

````
postgres (PostgreSQL) 11.2
````

If that returns an *unrecognized command error*, return to the installation instructions for your operating System...

* Windows
* OSX

<br>

## 1. Login to pgsql

Run the following shell command...

````
psql postgres

````
<br>

## 2. Create a new database
You can create many databases on a Postgres server instance.

Let's start by creating one using the [CREATE DATABASE](https://www.postgresql.org/docs/11/sql-createdatabase.html) command...

````SQL
CREATE DATABASE widgetdb;
````

View all databases on the instance...

````
\list
````

You will notice that there are also a number of default databases. Ignore these.

<br>

## 3. Switch to widgetdb
As there may be many databases on the Postgres instance, we will now switch to the database we wish to use...

Run the following...

````
\c widgetdb
````

You will now see the response...

````
You are now connected to database "widgetdb" as user...
````

<br>

## 4. Create widget table

The [CREATE TABLE](https://www.postgresql.org/docs/11/sql-createtable.html) command does...you guessed - creates a table in the database. A table is like the rows and named columns of a spreadsheet. More on that later...

Carefully copy, paste and run the following CREATE TABLE command...

````SQL
CREATE TABLE widget (widgetid SERIAL PRIMARY KEY, name varchar(255) NOT NULL, description varchar(255) NOT NULL, heightmm INTEGER NOT NULL, lengthmm INTEGER NOT NULL, widthmm INTEGER NOT NULL, weightgm INTEGER NOT NULL, valueaud NUMERIC(7,2) NOT NULL);
````

The new table is called *widget* and it contains eight columns - *widgetid,  name, description, heightmm, lengthmm, widthmm, weightgm, valueaud*. Each column name is followed by a data type and some other defining parameters. You can probably already guess a lot about the table's definition just by reading the command. More on table definition later...

<br>

## 5. View the widget table

Run the following psql command to view the tables in the widget database...

````
\dt
````

Which will return the following response...

````SQL
       List of relations
Schema |  Name  | Type  | Owner
--------+--------+-------+-------
public | widget | table | rach
(1 row)

widgetdb=#

````

<br>

## 6. Query the contents of the widget table

We use the [SELECT](https://www.postgresql.org/docs/11/sql-select.html) command to query (*ask for a copy*) data in a table...

Run the following SELECT command to return *all* fields (as denoted by the asterisk) in *all* records...

````SQL
SELECT * FROM widget;
````

...which will return **0 rows** (below) because so far we have only created the table structure but not added any **data**.

````SQL
widgetid | name | description | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+------+-------------+----------+----------+---------+----------+----------
(0 rows)
````

<br>

## 7. Inserting data

The [INSERT](https://www.postgresql.org/docs/11/sql-insert.html) command is used to insert a new record.

Run the following INSERT command to insert a new widget record...

````SQL
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget1','medicated',69,34,16,4,0.5);
````

Notice that [SQL keywords](https://www.postgresql.org/docs/11/sql-keywords-appendix.html); such as INSERT, INTO AND VALUES are uppercase, and that the command is terminated with a semicolon.

There are two comma separated parenthesis sets. The first one contains field names, the second contains the values which correspond to those fields.

Querying the widget table again should produce **1 row** of results...

````SQL
widgetdb=# SELECT * FROM widget;
widgetid |  name   | description | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+---------+-------------+----------+----------+---------+----------+----------
       1 | widget1 | medicated   |       69 |       34 |      16 |        4 |     0.50
(1 row)

````
<br>

## 8. Insert some more data

Carefully copy and paste the following 4 **INSERT** statements, and run it...

````SQL
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget2','knee-slapper',40,12,6,2,1.76);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget3','shaky',96,0,14,1,6.85);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget4','sticky',66,47,20,2,3.72);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget5','different',39,7,23,3,4.02);
````

Now we have five records. We can see them...

````SQL
postgres=# select * from widget;
widgetid |  name   | description  | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+---------+--------------+----------+----------+---------+----------+----------
       1 | widget1 | medicated    |       69 |       34 |      16 |        4 |     0.50
       2 | widget2 | knee-slapper |       40 |       12 |       6 |        2 |     1.76
       3 | widget3 | shaky        |       96 |        0 |      14 |        1 |     6.85
       4 | widget4 | sticky       |       66 |       47 |      20 |        2 |     3.72
       5 | widget5 | different    |       39 |        7 |      23 |        3 |     4.02
(5 rows)

````

<br>


# Let's review what we have done

A **database server** can contain and often does contain many databases. Each one has a seperate name. We can create a database using the `CREATE DATABASE` command.

A database can contain one or more **tables**. It is a collection of rows and named columns - similar to that of a spreadsheet. Each row is a *record* (containing data) and each named column contains a field of data belonging to the record. Once again - think of a spreadsheet. We can create a database using the `CREATE TABLE` command.

When we create a database table we must provide the name of the table, the names of the columns and also other parameters which define the data that will be contained in the columns.

Our widget table has eight columns. Let's talk about data types and then break them down...

# Postgres data types

[Postgres data types](https://www.postgresql.org/docs/11/datatype.html) include...

* Numeric
* Character
* Boolean
* Date/Time
* JSON
* XML
* Network addresses

Let's look at the data types used to create our **widget** table...

<br>

## :mag: `widgetid SERIAL PRIMARY KEY`

The **widgetid** field will store the widget's id. As our table will contain many records, it is important that each widget record has a unique identifier.

* The [SERIAL](https://www.postgresql.org/docs/11/datatype-numeric.html#DATATYPE-SERIAL) keyword tells the database to take care of providing automatically generated, sequential numbers for this field. So we need never worry that two records will have the same id.
* The [PRIMARY KEY](https://www.postgresql.org/docs/11/ddl-constraints.html#DDL-CONSTRAINTS-PRIMARY-KEYS) keyword tells the database that this field is the unique identifier for the record.

<br>

## :mag: `name varchar(255) NOT NULL`

The **name** field will store the widget's name (no way!). It is string data which may vary in length so we are going to use the [varchar](https://www.postgresql.org/docs/11/datatype-character.html) data type (also known as **Character**) for this column; setting a 255 character limit (seems more than reasonable for a name, right?).

The [NOT NULL](https://www.postgresql.org/docs/11/ddl-constraints.html#id-1.5.4.5.6) keyword tells the database that this field can never be empty. As a result, the database will reject all attempts to insert a new widget record that do not contain a name value. Good stuff!

<br>

## :mag: `description varchar(255) NOT NULL`
The **description** field will store the widget's description (again, no way!). It is string data which may vary in length so once again we are going to use the [varchar](https://www.postgresql.org/docs/11/datatype-character.html) data type (also known as **Character**) for this column; setting a 255 character limit.

This field is also [NOT NULL](https://www.postgresql.org/docs/11/ddl-constraints.html#id-1.5.4.5.6).

<br>

## :mag: `heightmm INTEGER NOT NULL`
The **heightmm** field will store the widget's height in millimeters as an [integer](https://www.postgresql.org/docs/11/datatype-numeric.html#DATATYPE-INT). Also [NOT NULL](https://www.postgresql.org/docs/11/ddl-constraints.html#id-1.5.4.5.6).

<br>

## :mag: `lengthmm INTEGER NOT NULL`
Similar to above.

<br>

## :mag: `widthmm INTEGER NOT NULL`
Similar to above.

<br>

## :mag: `weightgm INTEGER NOT NULL`
Similar to above.

<br>

## :mag: `valueaud NUMERIC(19,2) NOT NULL`
The **valueaud** field will store the AUD value of the widget. It uses the type [numeric](https://www.postgresql.org/docs/11/datatype-numeric.html#DATATYPE-NUMERIC-DECIMAL). We provide a *precision* and *scale*. In this case, allowing up to 7 digits on the left (precision) and rounding to 2 digits on the right.

# Queries
When we use the **SELECT** command, we are asking for a copy of the data -  a *query*. We previously ran the following command...

````SQL
SELECT * FROM widget;
````

Which returned all (*) fields for all records in the widget table (5). But what if we only wanted to see the records that matched specific *criteria*?

<br>

## SQL WHERE clause

The [WHERE](https://www.postgresql.org/docs/11/queries-table-expressions.html#QUERIES-WHERE) clause allows you to specify criteria in your query.

For example, let's say we wanted to see the record(s) for the widget having the name *widget1*...

````SQL
SELECT * FROM widget WHERE name = 'widget3';
````
...the results...

````SQL
widgetid |  name   | description | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+---------+-------------+----------+----------+---------+----------+----------
       3 | widget3 | shaky       |       96 |        0 |      14 |        1 |     6.85
(1 row)

````

Note that literal strings are wrapped in **single quotes**.

<br>

In this example, we will ask for all widgets having a *valueaud* of 1.76...

````SQL
SELECT * FROM widget WHERE valueaud = 1.76;
````

...the results...

````SQL
widgetid |  name   | description  | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+---------+--------------+----------+----------+---------+----------+----------
       2 | widget2 | knee-slapper |       40 |       12 |       6 |        2 |     1.76
(1 row)

````

<br>

In the preceding examples we have asked for all (*) fields of the records matching our WHERE criteria - but perhaps we only wish to see one field.

Try this...

````SQL
SELECT name FROM widget WHERE valueaud = 1.76;
````

...results...

````SQL
 name  
---------
widget2
(1 row)
````

<br>

You can ask for as many fields as you like. Seperate the field names with a comma...

````SQL
SELECT name, description FROM widget WHERE valueaud = 1.76;
````

...results...

````SQL
 name   | description 
---------+--------------
widget2 | knee-slapper
(1 row)
````

<br>

## Multiple WHERE criteria with Logical Operators

We can use [Logical operators AND, OR and NOT](https://www.postgresql.org/docs/11/functions-logical.html) to further define our query...

<br>

Note the use of **AND**...

````SQL
SELECT name, description FROM widget WHERE valueaud = 4.02 AND weightgm = 3;
````
...results...

````SQL
 name   | description
---------+-------------
widget5 | different
(1 row)
````

<br>

Note the use of **OR**...

````SQL
SELECT name, description FROM widget WHERE valueaud = 4.02 OR weightgm = 4;
````

...results...

````SQL
 name   | description
---------+-------------
widget1 | medicated
widget5 | different
(2 rows)
````

<br>

<br>

Note the use of **NOT**...

````SQL
SELECT name, description FROM widget WHERE NOT valueaud = 4.02;
````

...results...

````SQL
 name   | description 
---------+--------------
widget1 | medicated
widget2 | knee-slapper
widget3 | shaky
widget4 | sticky
(4 rows)
````

<br>

## Comparison Operators
The [Comparison Operators](https://www.postgresql.org/docs/11/functions-comparison.html) we know and love are available to SQL queries...

````
* < less than
* > greater than
* <= less than or equal to
* >= greater than or equal to
* <> or != not equal
````
<br>

Let's query the database for all widgets having *valueaud* of 3.00 or more...

````SQL
SELECT * FROM  widget WHERE valueaud > 3;
````

...results...

````SQL
widgetid |  name   | description | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+---------+-------------+----------+----------+---------+----------+----------
       3 | widget3 | shaky       |       96 |        0 |      14 |        1 |     6.85
       4 | widget4 | sticky      |       66 |       47 |      20 |        2 |     3.72
       5 | widget5 | different   |       39 |        7 |      23 |        3 |     4.02
(3 rows)
````

<br>

### ORDER BY

For our next trick, let's order the returned results by *valueaud*.

````SQL
SELECT * FROM  widget WHERE valueaud > 3 ORDER BY valueaud;
````

...results...

````SQL
 widgetid |  name   | description | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+---------+-------------+----------+----------+---------+----------+----------
       4 | widget4 | sticky      |       66 |       47 |      20 |        2 |     3.72
       5 | widget5 | different   |       39 |        7 |      23 |        3 |     4.02
       3 | widget3 | shaky       |       96 |        0 |      14 |        1 |     6.85
(3 rows)
````

Remember - when we run a **SELECT** query, we are asking for a *copy* of the data - so including an ORDER BY clause does *not* alter the original data.

**ORDER BY** sorts the values in *ascending* order by default.

<br>

Want to sort in the other direction? We can explicitly state the sort direction using the **ASC** (ascending) and **DESC** (descending) keywords...

````SQL
SELECT * FROM  widget WHERE valueaud > 3 ORDER BY valueaud DESC;
````

...results...

````SQL
widgetid |  name   | description | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+---------+-------------+----------+----------+---------+----------+----------
       3 | widget3 | shaky       |       96 |        0 |      14 |        1 |     6.85
       5 | widget5 | different   |       39 |        7 |      23 |        3 |     4.02
       4 | widget4 | sticky      |       66 |       47 |      20 |        2 |     3.72
(3 rows)
````

<br>

Want to order the results by multiple fields? No problem! Include the name of each field to order by, separated by a comma. The results will be filtered by the first field, then the second, and so on...

<br>


#  Changing the data - UPDATE

We can modify records using the [UPDATE](https://www.postgresql.org/docs/11/dml-update.html) command. Supply the name of a given field(s) and a value(s), followed by the WHERE criteria which identifies the record(s) to be updated. In the following example, we update the *name* field of the widget with an id of *3*


````SQL
UPDATE widget SET name = 'Widget 3' WHERE widgetid = 3;
````

...results...

````SQL
widgetid |   name   | description  | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+----------+--------------+----------+----------+---------+----------+----------
       1 | widget1  | medicated    |       69 |       34 |      16 |        4 |     0.50
       2 | widget2  | knee-slapper |       40 |       12 |       6 |        2 |     1.76
       4 | widget4  | sticky       |       66 |       47 |      20 |        2 |     3.72
       5 | widget5  | different    |       39 |        7 |      23 |        3 |     4.02
       3 | Widget 3 | shaky        |       96 |        0 |      14 |        1 |     6.85
(5 rows)
````

<br>

In this example, we update multiple fields for the record...

````SQL
UPDATE widget SET name = 'Widget 4', description = 'A new sticky description' WHERE widgetid = 4;
````

...results...

````SQL
widgetid |   name   |       description        | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+----------+--------------------------+----------+----------+---------+----------+----------
       1 | widget1  | medicated                |       69 |       34 |      16 |        4 |     0.50
       2 | widget2  | knee-slapper             |       40 |       12 |       6 |        2 |     1.76
       5 | widget5  | different                |       39 |        7 |      23 |        3 |     4.02
       3 | Widget 3 | shaky                    |       96 |        0 |      14 |        1 |     6.85
       4 | Widget 4 | A new sticky description |       66 |       47 |      20 |        2 |     3.72
(5 rows)
````

:dragon: **HERE BE DRAGONS** :dragon:
Ensure that you specify the correct **WHERE** criteria or you will end up modifying the wrong records. A common mistake is to forget the WHERE criteria - which results in all records being updated!

<br>

# Deleting the data - DELETE
We can delete entire records by using the [DELETE](https://www.postgresql.org/docs/11/dml-delete.html) command. Field names are not required - when we run DELETE, we are deleting the record entirely. There is no option to delete a single field. Once again, we need to include the WHERE criteria to ensure the we delete the desired record(s).

````SQL
DELETE FROM widget WHERE lengthmm = 0;
````

...results...

````SQL
widgetid |   name   |       description        | heightmm | lengthmm | widthmm | weightgm | valueaud
----------+----------+--------------------------+----------+----------+---------+----------+----------
       1 | widget1  | medicated                |       69 |       34 |      16 |        4 |     0.50
       2 | widget2  | knee-slapper             |       40 |       12 |       6 |        2 |     1.76
       5 | widget5  | different                |       39 |        7 |      23 |        3 |     4.02
       4 | Widget 4 | A new sticky description |       66 |       47 |      20 |        2 |     3.72
(4 rows)
````

<br>


# Dropping a table
Need to delete a table? A table which is not a relation of another table can be *dropped* with the [DROP TABLE](https://www.postgresql.org/docs/11/sql-droptable.html) command...

````SQL
DROP TABLE widget;
````

# Dropping a database
Need to delete the database from the server? The [DROP DATABASE](https://www.postgresql.org/docs/11/app-dropdb.html) will help you there.

**Note:** You cannot drop a database that you are currently *in* so before attempting to run the drop, switch back to the default Postgres database...

````
\c postgres
````

...then run the drop...


````SQL
DROP DATABASE widgetdb;
````

<br>

<hr>

# :trophy: Pairs SQL Challenge

Let's run some queries...

1. If you have already created the widget database (from above), drop it from the Postgres server so that we can start again.
2. Create a new database called *widgetdb*.
3. Switch to the *widgetdb* database.
4. Create a new table called *widget*.
5. Run the **INSERT** statements found below to populate your database with 100 widget records.
6. ...

**Select Queries**
* How many records have a *valueaud* greater than 5?
* How many records have a *valueaud* less than 3?
* How many records have a *valueaud* greater than 5?
* What is the id of the widget that has a *heightmm* of 0?
* How many records have a *widthmm* greater than 10 and a *heightmm* greater than 30.

**Updates**
* Update the *valueaud* of the widget having id *50*. The new value should be *4.01*.
* Update the *lengthmm of the widget having the id *69*.

**Deletes**
* Delete the widget that has an id of 55.
* Delete all widgets that have a *weightgm* of *5*.

**Inserts**
* Insert 3 new widget records using the data of your choice.

<br>

**More queries**
* Write a query which returns (only) the *name* and *valueaud* of only the records inserted in the previous step.
* Write a query which returns (only) the valueaud of all records.

<br>

:imp: **BEAST** :imp:

* Use a SQL wildcard to select all records with a description that starts with the letter **p**.
* Use a SQL wildcard to select all records with a description that contains the letter **a**.
* Use a SQL function to return the maximum *valueaud* value.
* Use a SQL function to return the minimum *valueaud* value.
* Use a SQL function to return the average *valueaud* value.

<br>

<hr>

````SQL
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget1','medicated',69,34,16,4,0.5);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget2','knee-slapper',40,12,6,2,1.76);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget3','shaky',96,0,14,1,6.85);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget4','sticky',66,47,20,2,3.72);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget5','different',39,7,23,3,4.02);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget6','humdinger',4,44,25,1,8.71);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget7','civil',87,2,0,2,7.66);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget8','lonely',41,4,2,4,9.99);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget9','powerful',94,44,5,5,4.45);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget10','sticky',43,41,13,1,6.29);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget11','aware',48,8,5,3,4.82);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget12','good-humored',67,11,16,2,2.54);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget13','healthy',16,31,0,2,9.67);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget14','startled',60,26,15,2,1.02);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget15','suitable',65,27,25,1,5.3);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget16','lonely',43,9,0,2,5.35);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget17','gelastic',51,46,10,1,4.36);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget18','powerful',43,1,10,4,9.34);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget19','immediate',94,17,25,4,1.16);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget20','unfair',31,39,1,4,8.38);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget21','desperate',26,42,16,5,7.71);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget22','playful',52,0,24,5,3.37);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget23','haunting',49,41,15,1,7.14);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget24','unable',9,37,23,2,8.65);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget25','elated',59,0,18,1,7.6);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget26','harsh',85,11,14,5,7.36);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget27','tiny',97,39,9,2,0.37);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget28','costumed',41,15,22,3,1.47);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget29','global',91,7,25,4,8.49);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget30','popular',36,23,13,0,6.01);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget31','costumed',37,15,20,4,3.02);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget32','self-centered',66,20,15,4,5.15);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget33','confused',34,50,3,3,9.91);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget34','additional',88,49,0,4,6.99);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget35','insecure',68,0,23,5,4.49);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget36','unlikely',4,8,13,1,9.99);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget37','glorious',6,34,9,2,4.72);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget38','capricious',99,14,8,4,2.38);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget39','duck-like',35,14,16,5,1.96);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget40','insecure',76,13,6,2,8.92);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget41','important',49,18,18,3,6.75);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget42','southern',25,47,4,2,9.62);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget43','recent',24,2,7,0,0.98);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget44','jocular',47,13,2,5,6.93);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget45','practical',88,17,23,4,5.56);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget46','happy',38,35,11,5,6.34);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget47','silly',51,26,19,4,1.36);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget48','metal',63,20,3,1,8.27);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget49','deep',60,42,17,4,8.56);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget50','visible',9,50,0,4,3.67);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget51','different',78,29,10,1,5.05);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget52','additional',8,29,21,2,6.65);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget53','electrical',51,2,17,1,2.23);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget54','practical',57,26,7,3,7.22);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget55','maniacal',19,16,11,3,9.26);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget56','stubborn',90,17,3,3,7.23);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget57','wild',9,17,0,1,8.22);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget58','screaming',72,41,9,0,4.51);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget59','slapstick',11,43,3,0,5.45);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget60','available',63,15,11,5,2.26);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget61','demanding',80,25,0,3,0.67);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget62','immediate',23,47,9,1,6.39);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget63','sportive',69,10,2,0,0.16);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget64','basic',7,42,10,4,6.72);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget65','powerful',17,17,14,3,6.5);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget66','automatic',47,45,12,1,3.33);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget67','jovial',15,8,24,1,1.68);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget68','informal',95,4,4,4,5.94);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget69','sorry',83,3,16,0,2.91);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget70','impressive',91,12,23,1,7.16);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget71','jocular',8,36,16,1,1.55);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget72','afraid',26,21,7,0,0.44);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget73','insecure',59,49,0,1,9.65);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget74','droll',72,32,11,3,0.56);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget75','reasonable',48,36,19,5,9.84);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget76','risible',92,32,21,5,8.46);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget77','slimy',45,33,3,2,4.18);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget78','joking',70,49,18,1,5.04);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget79','hyperactive',83,17,9,1,4.68);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget80','medical',26,2,14,1,2.47);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget81','twisted',27,31,15,4,3.3);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget82','waggish',39,30,18,5,5.65);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget83','glad',6,43,9,3,9.71);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget84','recent',86,17,6,0,1.53);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget85','gleeful',77,30,9,5,4.0);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget86','united',69,30,0,5,7.15);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget87','united',34,48,17,4,4.64);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget88','impertinent',56,49,23,1,0.18);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget89','impertinent',24,41,17,5,6.78);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget90','absurd',0,3,3,3,5.91);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget91','latter',58,35,24,4,8.23);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget92','different',76,39,5,4,3.83);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget93','tiny',40,43,5,1,0.44);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget94','hilarious',93,31,10,2,0.76);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget95','sickened',3,0,8,1,9.85);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget96','desperate',31,45,7,1,6.77);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget97','insane',12,47,0,2,2.43);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget98','playful',56,13,0,1,3.26);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget99','every',33,41,4,1,4.91);
INSERT INTO widget(name,description,heightmm,lengthmm,widthmm,weightgm,valueaud) VALUES ('widget100','sick',47,44,23,0,6.77);
````
<br>

<hr>

## Postgres command cheat list.

:sunglasses: `\q: Quit/Exit`

:sunglasses: `\c another_db : Switch to a another database named another_db`

:sunglasses: `\d user: Show table definition including triggers`

:sunglasses: `\l: List databases on your postgres server`

:sunglasses: `\copy (SELECT * FROM __table_name__) TO 'file_path_and_name.csv' WITH CSV: Export a table as CSV`

:sunglasses: `\pset pager off` Result paging on or off.

<br>

[PostgreSQL Tutorial](https://www.tutorialspoint.com/postgresql/index.htm)


