# Rails mini challenge

You will be paired up for this task. A list of steps will be provided over the course of the day that may help with trouble areas. For now, think through how you would make this app based on the deliverables. The deliverables are ordered so that you should be able to approach them as something of an instruction set.
If you are more comfortable with the Rails process than your partner, please use this as a chance to help them to understand what is happening. Being able to do this is also a valuable skill.  All going well you will soon be working with much more experienced coders by your side, and I hope they have this skill in spades.

*Deliverables*
- CRUD operations for artists, albums, and tracks, with the following stipulations:
- The root route will be the *same* as the artists index page.
- Artists must have *at least* name, year of birth, and whether they are currently active (and as many others as you would like - this applies to all resources).
- Albums must have attributes of (at least) title, year, and length.
- Tracks must have title and length.
- Artists will have many albums, but albums have *one and only one* artist.
- Albums can have many tracks (or none), and tracks can have many albums (but at least one)
- Seed your database with a few of each resource using the seed file or console (I can help by adding to the seed file if required, although you may need to modify the file based your your resource configurations).
- Provide index pages for each of artists, albums and tracks
- Provide a link to add a new artist on the artist index page (and a new artist page to add an artist).
- Provide navigation links up the top of the page (that remain on every page) that link to the artists, albums, and tracks index pages.
- Show, edit, and delete options also available on the index page of every resource (artists, albums, and tracks), including show pages available through a link via the listed entity (that is, if on the index page you see “Beyonce”, you can click the string “Beyonce” to get to the show page for the artist).
-  New albums are *only* to be added on the artists show page (so the album would be added to that specific artist, and albums must be tied to an artist).
- The album index page must *not* have any way to add a new album.
- The album show page lists all the tracks added to this album, or informs the user that there are no tracks added to this album as yet.
- The album show page also has *two* ways to add a track to the album. The track can be added by choosing from a list of tracks already on the database (where the track is assumed to be added to the album featured on the show page). *Or* you can add a totally new track (again, that will be added to the current album).
- A link to create a new track is on the tracks index page. Following that link presents a form. The form will provide field for all the elements of the track, and a drop down list of albums to choose from to add the track to.
- The track show page will also list the albums that the track appears on.
- Every page should have appropriate links to move comfortably through the site.

*Extension*
- Install the _*devise*_ gem. Follow the steps carefully.
- Make sure you also have all the views.
- Put the sign-in and logout options into the navbar.
- Add a comments section for the artists page.
- Add a form to accept a new comment below the form to add an album (with an appropriate heading above it.
- If there are any comments for this artist, they should appear in a list below the form (or the form can come after if you like).
- Each comment should have some information about the user who made the comment, and the content.
- If there are no comments then the user should be informed about this.