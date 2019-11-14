# Class for User Interface
require 'pry'

class BooksCLI::CLI
    def call #initial call to start the program. Welcome Screen
        puts "WELCOME TO BOOK SEARCH \n"
        search
        save_book
    end

    def search #start the search process. User enters a search term and results are returned
        puts "Search for a book:  "
        input_str    #method for string input
        search = BooksCLI::GoogleApi.new(@input) # input sent to GoogleApi
        search.set_info
        get_books
    end

    def get_books
        @books = BooksCLI::Book.all    #books are retrieved from Books class
        @books.each.with_index(1) do |book, index|  #results are formatted to a list with a number for selection
            puts "#{index}. Title: #{book.title}, 
            Author: #{book.authors}, Publisher: #{book.publisher}"
        end
    end

    def save_book 
        puts "Save a Book to Reading List? (y/n)" #Option to save a book to reading List
        input_str
        @input == 'y' ? input_int : options  
        book = @books[@input]
        BooksCLI::Book.saved(book) 
        puts "* Book Saved! * \n"
        options
    end

    def show_list 
        puts  "Reading List: \n"
        list = BooksCLI::Book.list 
        list.each do |book| # iterate through list to show book list.
            puts " Title: #{book.title}, Author: #{book.authors}, Publisher: #{book.publisher}\n"
        end
        options 
    end

    def options #options menu for a new search, view reading list or exit
        option_menu
        input_str
        case @input 
        when 'list'
            show_list 
        when 'new'
            @books.clear
            search
            save_book
        when 'exit'
            goodbye
        else
            puts "Please Choose an Option"
            options 
        end
    end
    
    # input methods with conditions for reusability
    def input_str
        @input = gets.strip.downcase
        if @input.empty? 
            not_valid
            input_str
        end
    end

    def input_int
        puts "Enter Line Number of Book: "
        @input = gets.chomp.to_i
        if @input.between?(1,6) 
            @input= @input -1
        else
           not_valid
           input_int
        end
    end
    
    # string output separated from the options method for reusability.
    def option_menu
        puts "CHOOSE OPTION \n"
        puts "View Reading List? (type 'list')\n"
        puts "New Search? (type 'new')\n"
        puts "Exit program? (type 'exit')\n"
    end

    def not_valid
        puts 'Entry not valid, please try again'
    end
    
    def goodbye 
        puts "Goodbye"
    end
end
