# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Book do
  subject(:book) do
    Book.new(
      title,
      publication_date,
      author,
      rating
    )
  end

  let(:title) { ' 1984 ' }
  let(:publication_date) { ' 1949 ' }
  let(:author) { ' George Orwell ' }
  let(:rating) { ' 4.5 ' }

  describe 'initialization' do
    it 'strips title' do
      expect(book.title).to eq('1984')
    end

    it 'strips publication date' do
      expect(book.publication_date).to eq('1949')
    end

    it 'strips author name' do
      expect(book.author).to eq('George Orwell')
    end

    it 'converts rating to float and strips it' do
      expect(book.rating).to eq(4.5)
    end
  end
end
