class BooksCLI::CLI
    def call
        start
    end

    def start
        puts "Search Google Books: "
        #booksCLI::GoogleApi.new.set_info ? get info from api methods
        input = gets.strip.downcase
        # search method - starts CLI
        show_list
        options
    end

    def show_list
        puts "Search Results:"
        #map through info and display list with number
        puts "Would you like to save a book to your reading list? (y/n)"
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            save
        else
            options
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

    def options
       #choice for new search or exit
       puts "Enter 'new'for new search, 'view' to see library, 'exit' to leave program"
       if input == "new"
        start
       elsif input == "view"
        reading_list
       else 
        thanks
       end
    end

    def thanks
        puts "Thank you for visiting Google Books"
    end
end