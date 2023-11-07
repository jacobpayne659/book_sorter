# frozen_string_literal: true

require 'spec_helper'
require_relative '../book_sorter'
require_relative '../book'

# Under the Dome, January 22 2000, Stephen King, 5
# The Code Breaker, May 3 2022, Walter Isaacson, 4.7
# Icebreaker, February 7 2023, Hannah Grace, 4.7
# None of This is True, August 8 2023, Lisa Jewell, 4.9
# Wildfire, October 3 2023 , Hannah Grace, no rating
# Cloud Cuckoo Land, September 28 2021, Anthony Doerr, no rating
# Billy Summers, August 3 2021, Stephen King, 4.8

RSpec.describe BookSorter do
  before(:all) do
    @books = [
      Book.new('The Code Breaker', 'May 3 2022', 'Walter Isaacson', '4.7'),
      Book.new('Icebreaker', 'February 7 2023', 'Hannah Grace', '4.7'),
      Book.new('Under the Dome', 'January 22 2000', 'Stephen King', '5'),
      Book.new('None of This is True', 'August 8 2023', 'Lisa Jewell', '4.9'),
      Book.new('Wildfire', 'October 3 2023', 'Hannah Grace', 'no rating'),
      Book.new('Cloud Cuckoo Land', 'September 28 2021', 'Anthony Doerr', 'no rating'),
      Book.new('Billy Summers', 'August 3 2021', 'Stephen King', '4.8')
    ]
    @sorter = BookSorter.new(@books)
  end

  context 'when sorting by publication date and author, ascending (oldest first)' do
    it 'sorts the books correctly' do
      sorted = @sorter.sort_by_publication_date_and_author

      expect(sorted.first.title).to eq('Under the Dome')
      expect(sorted.last.title).to eq('Wildfire')
    end
  end

  context 'when sorting by rating and title' do
    it 'sorts the books correctly and ignores leading articles' do
      sorted = @sorter.sort_by_rating_and_title
      expect(sorted.first.title).to eq('Under the Dome')
      expect(sorted.last.title).to eq('Icebreaker')
    end
  end

  context 'when sorting by title descending' do
    it 'sorts the books correctly in descending order' do
      sorted = @sorter.sort_by_title_descending
      expect(sorted.first.title).to eq('Wildfire')
      expect(sorted.last.title).to eq('Billy Summers')
    end
  end
end
