require 'date'
require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Rental do
  book = Book.new('title', 'author')
  person = Student.new(25, 'belal', parent_permission: true)
  date = Date.new(2021, 02, 11)
  rental = Rental.new(date, book, person)

  it 'has a date' do
    expect(rental.date).to eq(date)
  end

  it 'has a book' do
    expect(rental.book).to eq(book)
  end

  it 'has a person' do
    expect(rental.person).to eq(person)
  end

  it 'adds the rental to the book when created' do
    expect(book.rentals.length).to eq(1)
  end

  it 'adds the rental to the person when created' do
    expect(person.rentals.length).to eq(1)
  end
end
