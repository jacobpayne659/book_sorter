# frozen_string_literal: true

require_relative 'book_sorter'
require_relative 'csv_parser'

begin
  filename = ARGV[0] || 'books.csv'

  raise Errno::ENOENT, "File '#{filename}' not found" unless File.exist?(filename)

  books_from_csv = CSVParser.parse(filename)
  if books_from_csv.empty?
    puts 'No valid book data found.'
    exit 1
  end

  sorter = BookSorter.new(books_from_csv)

  puts 'Sorted by publication date then by author name ascending:'
  sorter.sort_by_publication_date_and_author.each do |book|
    puts "#{book.title} by #{book.author}, published on #{book.publication_date}"
  end

  puts "\nSorted by rating, ascending then by title ascending:"
  sorter.sort_by_rating_and_title.each do |book|
    rating = book.rating ? book.rating.to_s : 'No rating'
    puts "#{book.title} by #{book.author}, rating: #{rating}"
  end

  puts "\nSorted by title, descending:"
  sorter.sort_by_title_descending.each do |book|
    puts "#{book.title} by #{book.author}"
  end
rescue Errno::ENOENT => e
  puts e.message
  exit 1
rescue StandardError => e
  puts "An error occurred: #{e.message}"
  exit 1
end
