# frozen_string_literal: true

# csv_parser_spec.rb
require_relative '../csv_parser' # adjust the path as necessary

RSpec.describe CSVParser do
  describe '.parse' do
    let(:file_path) { 'spec/fixtures/books.csv' }
    let(:parsed_books) { CSVParser.parse(file_path) }

    it 'correctly parses a CSV file into an array of Book objects' do
      expect(parsed_books).to be_an(Array)
      expect(parsed_books.first).to be_a(Book)
      expect(parsed_books.first.title).to eq('Under the Dome')
      expect(parsed_books.last).to be_a(Book)
      expect(parsed_books.last.title).to eq('Billy Summers')
    end
  end
end
