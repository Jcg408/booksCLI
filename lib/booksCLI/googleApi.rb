require 'httparty'
require 'pry'
class BooksCLI::GoogleApi
    
    attr_accessor :input

    def initialize(input) #input from CLI class for search query.
        @input = input
    end

    # API call uses HTTParty gem to get hash response
    # Use Google Books API fields parameter to narrow down the returned information for easier iteration through data.
    # Use dotenv gem to store credentials
    # Catch StandardError errors with begin, rescue

   def fetch_data
        begin
            @key = ENV['GOOGLE_API_KEY']
            url = "https://www.googleapis.com/books/v1/volumes?q=#{@input}&fields=items(volumeInfo/title, volumeInfo/authors, volumeInfo/publisher)&maxResults=5&key=#{@key}"
            response = HTTParty.get(url)
        rescue StandardError => e
            puts "Error has occured. Unable to connect to host. Please check your connection."
            exit
        end
   end
   
   def set_info
        self.fetch_data["items"].each_with_index do |item, index|
            book = BooksCLI::Book.new
            book.title =  item["volumeInfo"]["title"]
            book.authors = item["volumeInfo"]["authors"]
            book.publisher = item["volumeInfo"]["publisher"]
        end
    end
end