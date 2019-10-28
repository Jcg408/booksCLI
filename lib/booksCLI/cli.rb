class BooksCLI::CLI
    def call
        puts "Welcome to Book Search"
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
        puts "Save a book to reading list? (Y/N)"
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            save_book
        else
            options
        end
       
       
    end

    def save_book
        puts "Enter book number to save."
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
        puts "Choose Option"
        puts "View Reading List? (enter 'list')"
        puts "New Search? (enter 'new')"
        puts "Exit program? (enter 'exit')"
        input = gets.strip.downcase

        case input
        when 'list'
            show_list
        when 'new'
            @books.clear
            start
        when 'exit'
            thanks
        else
            puts "please choose an option"
            options
        end
       
    end

    def show_list
        @list = BooksCLI::Books.list
        @list.each.with_index(1) do |book, index|
            puts "#{index}. Title: #{book.title}, 
                Author: #{book.authors}, Publisher: #{book.publisher}"
        end
        options
    end
    
    def thanks
    end
     
   
end