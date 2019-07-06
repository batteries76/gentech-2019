
# Install Postgres on Windows

1. Go to https://www.enterprisedb.com/download-postgresql-binaries and download the "Binaries from Installer Version 11.+" for Win x-86-64. 

This will download the zip file which contains all the files you need to run Postgres Database server on your machine. 

2. Unzip and copy the directory named pg-sql onto your local machine. Take note of the location.

For our system to be able to run postgres commands, we need to include the path of the bin folder inside pgsql which has all of the executables in our PATH. 

3. Find the path of the pg-sql\bin folder.

4. Open control panel>user accounts and click on 'Change my environment variables' on the left. 

This will list the environment variables available for your username. 

5. Double-click on 'PATH' to edit it. Click on 'New' and enter your bin path. (eg. *C:\Users\jsmith\Downloads\pgsql\bin*)

6. Now open a command prompt and run the following command, to see the version of Postgres installed. 

```
postgres --version
```

If that returns an *unrecognized command error*, there could be an issue in the PATH you have set in which case you will need to go back and check your PATH.

7. In the command prompt now navigate to the **pgsql** folder. 

```
cd C:\Users\<username>\<path>\pgsql
```

8. Create a directory named "data"...

````
mkdir data
````

9. Initialize your data folder...

```
initdb -D data
```

10. Start Postgres server...

```
start pg_ctl -D data start
```

The Postgres server runs by default on port **5432**.


11. You may now open the psql utility...

````
psql postgres
````

Notice that the shell prompt name changes to...

````
postgres=#
````

12. View all default databases on the instance...

````
\list
````

13. Exit psql

````
exit
````

## What now?

Now you can create your own database on the instance and do all the things!
