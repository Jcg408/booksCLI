require 'spec_helper'

feature 'External request' do
  it 'queries Google Books API' do
    uri = URI('https://www.googleapis.com/books/v1/volumes?')
    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end