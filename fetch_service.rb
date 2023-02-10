require_relative './app'

class FetchService
  def fetch_person
    return if !File.exist?('./people.json')

    person_file = File.open('./people.json')
    if (person_file.size.zero?)
      # App.new.run
      puts 'No person created!'
      # return false
    else
      JSON.parse(person_file.read)
    end
  end

  def fetch_books
    return if !File.exist?('./book.json')

    book_file = File.open('./book.json')
    if (book_file.size.zero?)
      # App.new.run
      puts 'No books created!'
      # return false
    else
      JSON.parse(book_file.read)
    end
  end

  def fetch_rentals
    return if !File.exist?('./rental.json')

    rental_file = File.open('./rental.json')
    if (rental_file.size.zero?)
      # App.new.run
      puts 'No rentals created!'
      # return false
    else
      JSON.parse(rental_file.read)
    end
  end
end
