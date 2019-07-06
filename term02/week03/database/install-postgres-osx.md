# Install Postgres on OSX
<br>

## Method 1: Using Postgres.app (recommended)

1. Follow the instructions at [Postgres.app](https://postgresapp.com/)

    **Note**: [Step 3](https://postgresapp.com/) creates a system level PATH to the Postgres.app command line tools (psql). You can optionally set the PATH in your bash profile. See Method 2: Using Homebrew > step 3 (below) for adding a PATH to your bash profile. Substitute the paths in the instructions below for the following path...

    *export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"*

2. You may now open the psql utility...

````
psql postgres
````

Notice that the shell prompt name changes to...

````
postgres=#
````

3. View all default databases on the instance...

````
\list
````

4. Exit psql

````
exit
````

<br>

## Method 2: Using Homebrew

[Homebrew](https://brew.sh/) is an installation manager for OSX.

Ensure that you have installed and configured Homebrew, before proceeding.

<br>

Check Homebrew is configured and installed...

````
brew -v
````

...you should see a similar response to...

````
Homebrew/homebrew-core (git revision 39ce...
````

If that returns an *unrecognized command error*, return to the installation instructions for your operating System, or continue below...

1. Open a terminal prompt and enter...

````
brew install postgresql
````

The Postgres server runs by default on port **5432**.


2. Check for successful installation... 

```
postgres --version
```
...which should return a message similar to...

````
postgres (PostgreSQL) 11.2
````

...if so, **skip to step 10**, or else...

...if that returns an *unrecognized command error*...

3. Change to your home directory...

````
cd  ~
````

4. Check your home directory for a .bash_profile...

````
ls -a
````

5. If you do have a .bash_profile, **skip to step 6**. If you do not, create one...

````
touch .bash_profile
````

6. Open .bash_profile...

````
open -a TextEdit .bash_profile
````

7. Carefully add the following lines to the end of all other lines...

    *export PATH="/usr/local/opt/icu4c/bin:$PATH"*

    *export PATH="/usr/local/opt/icu4c/sbin:$PATH"*

(assuming you have used default Homebrew installation.)

8. Save and close .bash_profile.

9. Open a new terminal window (this will load your new .bash_profile).

10. Start Postgres...

````
pg_ctl -D /usr/local/var/postgres start
````

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
