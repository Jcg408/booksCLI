
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
        response["items"].each_with_index do |item, index|
            title =  item["volumeInfo"]["title"]
            authors = item["volumeInfo"]["authors"]
            publisher = item["volumeInfo"]["publisher"]
            binding.pry
        end
    end

    def set_info
        puts self.fetch_data.title

    end

   
end