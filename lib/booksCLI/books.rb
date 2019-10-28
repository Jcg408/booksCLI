require 'pry'
class BooksCLI::Books
    
    attr_accessor :title, :authors, :publisher

    @@all = []
    @@list = []
   
    def initialize
        @@all <<self
      
    end
    
    def self.all
        @@all
    end

    def self.saved(book)
        @@list << book
       
    end

    def self.list
        @@list 
        binding.pry
    end

    def self.clear
        @@all.delete
    end

end