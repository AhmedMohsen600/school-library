require_relative '../book'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'author') }

  describe '#initialize' do
    it 'has a title' do
      expect(book.title).to eq('The Great Gatsby')
    end

    it 'has an author' do
      expect(book.author).to eq('author')
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      book.add_rental('rental')
      expect(book.rentals).to include('rental')
    end
  end
end
