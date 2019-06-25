### Random Student App Challenge

This will be a pair programming challenge to build a student management web app with Sinatra 👌. We will be putting the best app into production, and it will be used in class. This also means that you will want to think about checking the data that is entered so that it is a serious app, for example, checking for duplicates (although this can be done after you get the foundations built), and also so that the user experience is thought through.

- We are going to start with a couple of students, and go from there. 
- For this project we will be keeping the structure of our data flat - that is, beyond the nesting of the hashes in the array, there will be no further nesting. The reason for this will be apparent later.
- For the moment we are going to keep the students in memory. The extension will be to make this more permanent.

```rb
students = [
  {
    id: 1,
    name: "Paul Meier",
    email: "gentech1@coder.com",
    lightning_talk: false
  },
  {
    id: 2,
    name: "Mel McAdam",
    email: "gentech2@coder.com",
    lightning_talk: false
  }
]
```

Now we need to create some pages and endpoints:
- Create a page that displays all students names and emails.
- At the bottom of this page add a form to push a student to the array of students.
- Make sure each student gets the next id, if the last id is 2 (for Mel) the next id needs to be 3.
- You can send the user to a success (or failure page) if you like.
- You can link back to the same page after the post request is done.
- Make sure the list of students are links to their own page (the page should just show details for one student, also known as a 'show' page).
- It should be able to do all of the CRUD actions.

Now we want to add some more interesting features to this web app:
1. Create a random student selector page, you should go to a page like "/random" and it should have a button that when you click on it selects one student from the array and then displays their name on the same page. 
- This will need to take into account if a student has been called on previously.
- There are several ways to handle this route. You might need to add an extra column to the 'database'.  
2. Create a random pair programming generator page, you should go to a page like "/generate-groups" that lets enter a number and then displays groups of students of that number. 
- There are several edge cases to consider here. 
3. Extend the app in any way that might be helpful to the class, eg, add some extra features, such as search.

The above app in summary:

1. Can do all CRUD actions for students.
2. Can pick a student at random (and not repeat).
3. Can create groups of various sizes based on user input.