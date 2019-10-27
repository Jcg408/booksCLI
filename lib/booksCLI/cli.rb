class BooksCLI::CLI
    def call
        puts "Welcome to Book Search"
        start
    end

    def start
        puts "Search Google Books: "
        input = gets.strip.downcase
        data = BooksCLI::GoogleApi.new(input)
        
        data.fetch_data
        show_list
        # options
    end

    def show_list
        puts "Search Results:"
        @books = BooksCLI::Books.all
        @books.each.with_index(1) do |book, index|
            puts "#{index}. Title: #{book.title}, Author(s): #{book.authors}, Publisher: #{book.publisher}"
        puts "Would you like to save a book to your reading list? (y/n)"
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            save
        else
            puts " need options"
        end
        # puts out list of books from query
        # option to save to database 
       
        # choose a line number to save a book
        # need instances of books with index to save
    end

    def save
        puts "Enter book number to save to the reading list"
        input = gets.chomp.to_i
        if input > 0 && input < 6
            puts "You choose book number #{input}."
            #save book to
            options
        else
            thanks
        end
        
        #save data to file? db or json file?s
    end
    def reading_list
        puts "View Library? (y/n)"
        input = gets.strip.downcase
            if input == "yes" || input == "y"
                #need to show booklist = @@books.all
            else
                options
            end
        end

    # def options
    #    #choice for new search or exit
    #    puts "Enter 'new'for new search, 'view' to see library, 'exit' to leave program"
    #    if input == "new"
    #     start
    #    elsif input == "view"
    #     reading_list
    #    else 
    #     thanks
    #    end
    # end

    # def thanks
    #     puts "Thank you for visiting Google Books"
    # end
end