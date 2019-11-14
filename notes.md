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

I chose to use 3 different classes for separation of concern and single responsibility. I also kept the importance of naming conventions,  DRY, and format consistency in mind during the process. My testing consisted mostly of using Pry to check the individual methods and their relationships to the classes.  

I started by stubbing out the CLI class with pseudocode to determine what needed to be presented to the user, then I tested the API data to see how it was returned. I experimented with different query parameters to get the best response back from API. I then created the methods to fit the need, tested it - got it to work, then moved to the next piece of the puzzle and repeated the steps until I flushed out a whole section. 

Once I was able to run the entire program, I revisited the user interface (CLI class) to make sure the prompts were user friendly and made sense. I then adapted the code structure to make sure the flow was correct. Then, I went back to the other classes and worked on refactoring and drying up the code. Finally, I updated the documentation and comments in the code.

I realize there is room for improvement. Some of the spots I would like to revisit are:

1) In the CLI class I have recursive calls to save_book and options, which probably should exit after a set amount of attempts made with invalid input.

2) I can dry up the CLI a bit more by adding helper methods for the input whether string or integer.

3) I am convinced there is a better way to handle the storage of the data besides the class arrays in Book class.

I wanted to use a MVC approach for the classes so I thought of the googleApi as model, Books as controller and Cli as view.  

After sifting through the Google Api documentation I found a way to narrow down the search results to get closer to the title, author and publisher. Otherwise I would have to add extra iterations to get to the desired data. 

I stored the API key in a .env file which, normally I would place in .gitignore. However, I wasn't sure if the key would be needed for the assessment so I left the .env file for use. I will delete the key once the assessment is over.

-------------
UPDATE - CLI sent back for refactor. The issues needed to fix:

Code refactor -
1. (X) Update the Readme file with local dev setup instructions.
2. (X) Refactor the CLI class to increase reusability and dry up redundancy.
3. (X) Test API call to Google Books using WebMock
4. (X) Handle API failure with message to user.
5. (X) Explanation of missing tests.
6. (X) How would application need to change if you wanted it to be served as a web app or mobile app? Description.

Refactor notes -

README file - Includes the instructions for local dev setup.

CLI class - I chose to put input into 2 helper methods for string and integer input. I also extracted some string outputs to methods for reusability. I believe the class is more streamlined and cleaner.

Mock Test for API - Rspec/webmock test for Googleapi included in features folder.

Error Handling for API - error handling included in GoogleApi class for exception.

Explanation of missing tests - I regret not originally adding unit tests to this application. I do understand the importance of testing to ensure a safe and clean code as well as the benefit it gives other developers who may be working on the code. As a student, the assignments were built with tests that had to pass in order to be submitted so I have experience in reading tests in Ruby. However, there was no curriculum that taught test writing. After graduation, when I realized the importance of learning to write tests, I started by learning to write Jest for JavaScript. Unfortunately, I did not get to Ruby testing which I needed for this assignment. I did learn to write basic Rspec tests, but not enough to fully complement this application. I made the decision to submit the project with a mind to focus on principles of good coding skills and good documentation. I have started taking courses on Rspec as well as other testing platforms to improve my skill in testing. I included a basic Mock test for the Google API in the refactor.

Change application to a web app? - In order for this application to become a web application, it would need to be developed with client-server relationship in order to run in the browser. The client interaction would happen through the browser and not through the terminal. The application would also need a server for HTTP requests and access to a database. The application would need to have a front-end and a back-end. Since this app is built with Ruby, the most obvious choice would be to use Ruby on Rails to convert it to a web application.

Change application to a mobile app? - A mobile application is typically developed for a specific mobile platform. The application is considered native because it is downloaded on the device and is not accessed through a browser. To develop a mobile application, a specific platform is chosen, such as iOS, Windows, Android, etc. Each platform has specifications which must be followed to develop an app. Some platforms have select languages and IDEs which need to be used to develop applications. However, Rails and RubyMotion are both used to create mobile applications on iOS and Android. RubyMotion also uses command line interface for mobile app development. 
