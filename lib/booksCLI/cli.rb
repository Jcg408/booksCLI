# Class for User Interface
class BooksCLI::CLI

    def call #initial call to start the program. Welcome Screen
        puts "WELCOME TO BOOK SEARCH"
        puts "  "
        start
    end

    def start #start the search process. User enters a search term and results are returned
        puts "Search for a book: "
        puts "  "
        input = gets.strip.downcase #use stripe to remove white space and downcase to normalize the input 
        search = BooksCLI::GoogleApi.new(input) # input sent to GoogleApi
        search.set_info
        @books = BooksCLI::Book.all    #books are retrieved from Books class
        @books.each.with_index(1) do |book, index|  #results are formated to a list with a number for selection
            puts "#{index}. Title: #{book.title}, 
                Author: #{book.authors}, Publisher: #{book.publisher}"
        end
        puts "Save a Book to Reading List? (Y/N)" #Option to save a book to reading List
        input = gets.strip.downcase
        if input == "yes" || input == "y" #condition for input either yes or go to another option
            save_book
        else
            options
        end
    end

    def save_book #method to save the book to the Books class .
        puts " "
        puts "Enter Line Number of Book: "
        input = gets.chomp.to_i #set condition for valid input with recursive action if not a valid entry.
        if input >0 && input <=@books.size
            book = @books[input -1] #set line numbers by zero index using input -1
            BooksCLI::Book.saved(book) 
            puts " "
            puts "* Book Saved *"
            puts " "
            options
        else
            puts "Not a valid entry. Please try again"
            save_book #recursive : Future - make it exit after a set number of attempts
        end
    end
    
    def options #options menu for a new search, view reading list or exit
        puts "CHOOSE OPTION"
        puts " "
        puts "View Reading List? (type 'list')"
        puts " "
        puts "New Search? (type 'new')"
        puts " "
        puts "Exit program? (type 'exit')"
        puts " "
        input = gets.strip.downcase

        case input # conditions for options input. Used case instead of if else format for cleaner code.
        when 'list'
            show_list 
        when 'new'
            @books.clear
            start
        when 'exit'
            goodbye
        else
            puts "Please Choose an Option"
            options #recursive :Future - make it exit after a set number of attempts
        end
    end

    def show_list #return Reading List for books chosen.
        puts  "Reading List: "
        puts " " 
        list = BooksCLI::Book.list 
        list.each do |book| # iterate through list to show book list.
            puts " "
            puts " Title: #{book.title}, Author: #{book.authors}, Publisher: #{book.publisher}"
            puts " "
        end
        options #return back to options menu
    end
    
    def goodbye #exit method
        puts "Goodbye"
    end
end