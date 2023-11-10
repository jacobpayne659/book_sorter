# frozen_string_literal: true

# BookSorter class to do the book sorting!
class BookSorter
  require 'date'

  def initialize(books)
    @books = books
  end

  def sort_by_publication_date_and_author
    @books.sort_by do |book|
      last_name = book.author.split.last
      [Date.strptime(book.publication_date, '%B %d %Y'), last_name]
    end
  end

  def sort_by_rating_and_title
    @books.select { |book| book.rating.positive? }
          .sort_by { |book| [book.rating.to_f, ignore_articles(book.title)] }
          .reverse
  end

  def sort_by_title_descending
    @books.sort_by { |book| ignore_articles(book.title) }.reverse
  end

  private

  def ignore_articles(title)
    title.sub(/\A(The|A|An)\s+/i, '')
  end
end
