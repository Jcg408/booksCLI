# Books Class to handle books methods
require 'pry'
class BooksCLI::Books
    
    attr_accessor :title, :authors, :publisher 

    @@all = [] #Class array to hold API query response.
    @@list = [] #Class array to hold Reading List entries
   
    def initialize
        @@all <<self #initialize the response and push to class array
      
    end
    
    def self.all #reader method for the API responses
        @@all
    end

    def self.saved(book) # add selected book from CLI to class array
        @@list << book
       
    end

    def self.list
        @@list.each do |book| #iterate through the list for attributes to be used for reading list.
           @list = book
        end
    end

    def self.clear #empty out the books from the search before a new search.
        @@all.delete
    end

end