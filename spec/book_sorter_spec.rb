# frozen_string_literal: true

require 'spec_helper'
require_relative '../app/book_sorter'
require_relative '../app/book'

RSpec.describe BookSorter do
  let(:books) do
    [
      Book.new('The Code Breaker', 'May 3 2022', 'Walter Isaacson', '4.7'),
      Book.new('Icebreaker', 'February 7 2023', 'Hannah Grace', '4.7'),
      Book.new('Under the Dome', 'January 22 2000', 'Stephen King', '5'),
      Book.new('None of This is True', 'August 8 2023', 'Lisa Jewell', '4.9'),
      Book.new('Wildfire', 'October 3 2023', 'Hannah Grace', 'no rating'),
      Book.new('Cloud Cuckoo Land', 'September 28 2021', 'Anthony Doerr', 'no rating'),
      Book.new('Billy Summers', 'August 3 2021', 'Stephen King', '4.8')
    ]
  end
  subject(:sorter) { described_class.new(books) }

  describe '#sort_by_publication_date_and_author' do
    let(:sorted_books) { sorter.sort_by_publication_date_and_author }

    it 'sorts the books correctly with the oldest book first' do
      expect(sorted_books.first.title).to eq('Under the Dome')
      expect(sorted_books.last.title).to eq('Wildfire')
    end
  end

  describe '#sort_by_rating_and_title' do
    let(:sorted_books) { sorter.sort_by_rating_and_title }

    it 'sorts the books correctly and ignores leading articles' do
      expect(sorted_books.first.title).to eq('Under the Dome')
      expect(sorted_books.last.title).to eq('The Code Breaker')
    end
  end

  describe '#sort_by_title_descending' do
    let(:sorted_books) { sorter.sort_by_title_descending }

    it 'sorts the books correctly in descending order' do
      expect(sorted_books.first.title).to eq('Wildfire')
      expect(sorted_books.last.title).to eq('Billy Summers')
    end
  end
end
