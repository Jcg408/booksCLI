require 'httparty'
require 'pry'

class BooksCLI::GoogleApi
    attr_accessor :input

    def initialize(input)
        @input = input
    end

   def fetch_data
    url = "https://www.googleapis.com/books/v1/volumes?q=#{@input}&fields=items(volumeInfo/title, volumeInfo/authors, volumeInfo/publisher)&maxResults=5&key=AIzaSyA-h3olrB1IYcizfPJcMADnlT161h98fzo"
    response = HTTParty.get(url)
   end

   def set_info
        self.fetch_data["items"].each_with_index do |item, index|
            book = BooksCLI::Books.new
            book.title =  item["volumeInfo"]["title"]
            book.authors = item["volumeInfo"]["authors"]
            book.publisher = item["volumeInfo"]["publisher"]
        end
    end
end