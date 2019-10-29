Assignment Requirements:

Create a command line application that allows you to use the Google Books API to search for books and construct a reading list. 
 
You do not have to use a private GitHub repo for this.
 
This application should allow you to:
Type in a query and display a list of 5 books matching that query.
Each item in the list should include the book's author, title, and publishing company.
A user should be able to select a book from the five displayed to save to a “Reading List”
View a “Reading List” with all the books the user has selected from their queries -- this is a local reading list and not tied to Google Books’s account features.
 
For programming language, choose any language you want as long as it is NOT the same language as the one you chose to review for the tic-tac-toe application above, and the application must run on the command line. Feel free to use a library (or not) for the Google Book call or JSON parsing.
 
Please do NOT add any additional features. 
-----------------
PROCESS NOTES:

I chose Ruby as the language for this task because I found the process of implementing the classes and methods in Ruby a bit more logical. 

I chose to use 3 different classes for separation of concern and single responsibility. I also kept the importance of naming conventions and DRY in mind during the process. My testing consisted mostly of using Pry to check the individual methods and their relationships to the classes.  

I started by stubbing out the CLI class with pseudocode to determine what needed to be presented to the user, then I tested the API data to see how it was returned. I experimented with different query parameters to get the best response back from API. I then created the methods to fit the need, tested it - got it to work, then moved to the next piece of the puzzle and repeated the steps until I flushed out a whole section. 

Once I was able to run the entire program, I revisited the user interface (CLI class) to make sure the prompts were user friendly and made sense. I then adapted the code structure to make sure the flow was correct. Then, I went back to the other classes and worked on refactoring and drying up the code. Finally, I updated the documentation and comments in the code.

I realize there is room for improvement. Some of the spots I would like to revisit are:

1) In the CLI class I have recursive calls to save_book and options, which probably should exit after a set amount of attempts made with invalid input.

2) I can dry up the CLI a bit more by adding helper methods for the input whether string or integer.

3) I am convinced there is a better way to handle the storage of the data besides the class arrays in Book class.

I wanted to use a MVC approach for the classes so I used the googleApi as model, Books as controller and Cli as view.  

After sifting through the Google Api documentation I found a way to narrow down the search results to get closer to the title, author and publisher. Otherwise I would have to add extra iterations to get to the desired data. 

I stored the API key in a .env file which, normally I would place in .gitignore. However, I wasn't sure if the key would be needed for the assessment so I left the .env file for use. I will delete the key once the assessment is over.

