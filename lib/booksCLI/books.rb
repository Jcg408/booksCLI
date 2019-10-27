class BooksCLI::Books
    attr_accessor :title, :author, :publisher

    @@all = []

    def initialize
        @@all << self
    end
    
    def self.all
        @@all
    end

    
end