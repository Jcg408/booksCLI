class BooksCLI::CLI
    def call
        puts "Welcome to Book Search"
        puts "  "
        puts "Search for a book: "
        puts "  "
        start
       options
    end

    def start
        input = gets.strip.downcase
        search = BooksCLI::GoogleApi.new(input)
        search.set_info
        @books = BooksCLI::Books.all
        @books.each.with_index(1) do |book, index|
            puts "#{index}. Title: #{book.title}, Author: #{book.authors}, Publisher: #{book.publisher}"
        end
    end

    def options
        #NEED TO USE CASE FOR OPTIONS
        #SAVE BOOK, VIEW LIBRARY, START OVER, EXIT

        puts "Save Book to Library (enter line number)"
       
        input = gets.chomp.to_i
        if input > 0 && input < 6
            puts "You choose book number #{input}."
            save
        else
            
        end
        
    end

    
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