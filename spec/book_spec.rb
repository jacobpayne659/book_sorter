# frozen_string_literal: true

require 'spec_helper'
require_relative '../book'

# book_spec.rb
RSpec.describe Book do
  subject(:book) { described_class.new(title, publication_date, author, rating) }

  let(:title) { 'The best book in the world' }
  let(:publication_date) { 'June 6 2000' }
  let(:author) { 'Billy Boborgenson' }
  let(:rating) { '2.2' }

  describe 'initialization' do
    it 'strips whitespace from the title' do
      expect(book.title).to eq(title)
    end

    it 'strips whitespace from the publication date' do
      expect(book.publication_date).to eq(publication_date)
    end

    it 'strips whitespace from the author' do
      expect(book.author).to eq(author)
    end

    it 'converts rating to float and strips whitespace' do
      expect(book.rating).to eq(rating.to_f)
    end
  end
end
