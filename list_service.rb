class ListService
  def list_books(books, with_id: false)
    if with_id
      books.each_with_index do |book, idx|
        puts "#{idx}) Title: #{book.title}, Author: #{book.author}"
      end
    else
      if books.empty?
        puts "No books added yet\n\n"
        return
      end
      books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts ''
  end

  def list_people(people, with_id: false)
    if with_id
      people.each_with_index do |person, idx|
        puts "#{idx}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    else
      if people.empty?
        puts "No person created yet\n\n"
        return
      end
      people.each do |person|
        puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
    puts ''
  end

  def list_rentals(people)
    get_service = GetSerivce.new
    if people.empty?
      puts "People List is empty. Please add people in order to check their rentals\n\n"
      return
    end
    puts 'Select a person ID from the following list:'
    list_people(people)

    person_id =
      get_service.get_number('Person ID: ', 'Please enter a valid number!')
    person = people.find { |current_person| current_person.id == person_id }
    if person.nil?
      puts "Person with ID: #{person_id} not found!\n\n"
      return list_rentals(people)
    end

    if person.rentals.empty?
      puts "#{person.name} didn't rent any book yet\n\n"
    else
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} By #{rental.book.author}\n\n"
      end
    end
  end
end
