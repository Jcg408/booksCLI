class BooksCLI::Books
    attr_accessor :title, :authors, :publisher

    @@all = []
    
    def initialize
        @@all << self
    end
    
    def self.all
        @@all
    end

    
end