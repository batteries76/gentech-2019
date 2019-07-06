# Stackoverflow data explorer

## Explore the database
Use the Stackoverflow data explorer to mine their mountain of data!

https://data.stackexchange.com/stackoverflow/query/edit/1009075


Use **top** to limit results.

```sql
select top 100 * from users;
```

- Add an ORDER BY for reputation  
- Display the ordered results in descending order - DESC  
- Who is the top user?  

- Add a WHERE clause for location to see the users who are in Melbourne
- Use LIKE in the WHERE clause

- Use COUNT to get the count of total number of users 

- Use an inner join query on the users and posts tables to select the user's id, user's display name and their post body, ordered by user's reputation.

- Query the Tags table to find the top tag.
- Query the Tags table to find the count of *ruby* tag 

- Query the VoteTypes table to view the names of all vote types.

- Query the Badges table to view the names of all badges.

- Do you have a Stackoverflow profile? Use your account is to query your own data!


## Explore other people's queries

Want to see some **BIG** queries? 
https://data.stackexchange.com/stackoverflow/queries

