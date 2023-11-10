# frozen_string_literal: true

require 'csv'
require_relative 'book'

# CSVParser class to parse the books.csv file
class CSVParser
  def self.parse(file_name)
    books = []
    CSV.foreach(file_name, headers: false) do |row|
      title, publication_date, author, rating = row
      books << Book.new(title, publication_date, author, rating)
    end
    books
  end
end
