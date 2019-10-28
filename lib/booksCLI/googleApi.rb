require 'httparty'
require 'pry'

class BooksCLI::GoogleApi
    attr_accessor :input

    def initialize(input)
        @input = input
    end

    # API call uses HTTParty gem to get hash response
    # Used Google Books API fields parameter to narrow down the returned information for easier iteration through data.
    # Best practice to hide API key but left for testing purposes. Key restricted

   def fetch_data
    url = "https://www.googleapis.com/books/v1/volumes?q=#{@input}&fields=items(volumeInfo/title, volumeInfo/authors, volumeInfo/publisher)&maxResults=5&key=AIzaSyA-h3olrB1IYcizfPJcMADnlT161h98fzo"
    response = HTTParty.get(url)
   end
   # Iteration of data returned to set title, authors and publisher to be used in Books class.
   def set_info
        self.fetch_data["items"].each_with_index do |item, index|
            book = BooksCLI::Books.new
            book.title =  item["volumeInfo"]["title"]
            book.authors = item["volumeInfo"]["authors"]
            book.publisher = item["volumeInfo"]["publisher"]
        end
    end
end