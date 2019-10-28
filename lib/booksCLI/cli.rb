class BooksCLI::CLI
    def call
        puts "WELCOME TO BOOK SEARCH"
        puts "  "
        
        start
    end

    def start
        puts "Search for a book: "
        puts "  "
        input = gets.strip.downcase
        search = BooksCLI::GoogleApi.new(input)
        search.set_info
        @books = BooksCLI::Books.all
        @books.each.with_index(1) do |book, index|
            puts "#{index}. Title: #{book.title}, 
                Author: #{book.authors}, Publisher: #{book.publisher}"
        end
        puts "Save a Book to Reading List? (Y/N)"
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            save_book
        else
            options
        end
    end

    def save_book
        puts " "
        puts "Enter Line Number of Book: "
        input = gets.chomp.to_i
        if input >0 && input <=@books.size
            book = @books[input -1]
            BooksCLI::Books.saved(book)
            puts "Book Saved."
            options
        else
            puts "Not a valid entry. Please try again"
            save_book
        end
    end
    
    def options
        puts "CHOOSE OPTION"
        puts " "
        puts "View Reading List? (type 'list')"
        puts " "
        puts "New Search? (type 'new')"
        puts " "
        puts "Exit program? (type 'exit')"
        input = gets.strip.downcase

        case input
        when 'list'
            show_list
        when 'new'
            @books.clear
            start
        when 'exit'
            goodbye
        else
            puts "Please Choose an Option"
            options
        end
    end

    def show_list
       list = BooksCLI::Books.list
        list.each do |book|
            puts " "
            puts "#{book.title} - #{book.authors} - #{book.publisher}"
            puts " "
        end
        options
    end
    
    def goodbye
        puts "Goodbye"
    end
end