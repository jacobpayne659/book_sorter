# frozen_string_literal: true

# Book class to hold the book information
class Book
  attr_accessor :title, :publication_date, :author, :rating

  def initialize(title, publication_date, author, rating)
    @title = title.strip
    @publication_date = publication_date.strip
    @author = author.strip
    @rating = rating.strip.to_f
  end
end
