# vic-waste-data-challenge .csv parsing challenge

Here's a familiar one to get the wheels turning again...refer to your solution in the previous challenge from term 1, week 10.

In this challenge we will parse Victorian waste data contained within a .csv file.

1. Save the file called vicwaste.csv to your project directory. Take note of the headers and general structure of the data in the file.
2. Read the data into memory. You may use your own choice of data structure to store the data (hashes, arrays, hash of hashes, array of hashes, etc), however, the data should remain organised in such a way that the data can be identified by header/category.
3. Improve your code so that it can parse *any* .csv file - not *just this* .csv.
4. Re-organise your code...
    * Create a class which contains your method.
    * The method takes the file name to read.
    * Make the method a class method.
5. In a separate file, call the method that reads from the given file name.
6. Print the result.

*Excerpt of data obtained from [The Waste Management Facilities Database at data.gov.au](https://data.gov.au/dataset/ds-ga-a66ac3ca-5830-594b-e044-00144fdd4fa6/details?q=population)*

## Optional

If you solve that, please have a look at `.map`, `.select`, `.find`, and `.sort`. Have a play with each and see how they work.

## *Beast*
As an extra optional challenge, see if you can implement your own version of these functions.