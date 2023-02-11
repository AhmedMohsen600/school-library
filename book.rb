require_relative './rental'
# Book class
class Book
  attr_reader :title, :rentals, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    rentals << rental
  end
end
