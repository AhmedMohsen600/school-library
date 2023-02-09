require_relative './get_service'
require_relative './list_service'

class CreateService
  def initialize(people, books)
    @people = people
    @books = books
    @get_service = GetSerivce.new
    @list_service = ListService.new
  end

  def add_person
    person_type =
      @get_service.get_number(
        'Do you want to create a Student (1) or a teacher (2)?. Back to main (any number): ',
        'Please enter a valid number!'
      )
    case person_type
    when 1
      @people << add_student
    when 2
      @people << add_teacher
    else
      puts ''
    end
  end

  def add_student
    age = @get_service.get_number('Age: ', 'Please enter a valid number!')
    name = @get_service.get_str('Name: ', 'Please enter a proper name!')
    permission =
      @get_service.get_bool(
        'Parent permission (y/n): ',
        'Please enter either (y/n)!'
      )
    student = Student.new(age, name, parent_permission: permission)
    return unless student

    puts "Student #{name} is added!\n\n"
    student
  end

  def add_teacher
    specialization =
      @get_service.get_str(
        'Specialization: ',
        'Please enter a proper specialization!'
      )
    age = @get_service.get_number('Age: ', 'Please enter a valid number!')
    name = @get_service.get_str('Name: ', 'Please enter a proper name!')
    teacher = Teacher.new(specialization, age, name)
    return unless teacher

    puts "Teacher #{name} is added!\n\n"
    teacher
  end

  def add_book
    title = @get_service.get_str('Title: ', 'Please enter a valid title!')
    author = @get_service.get_str('Author: ', 'Please enter a valid author!')
    book = Book.new(title, author)
    return unless book

    puts "Book #{title} is created successfully!\n\n"
    book
  end

  def add_rental(books, people)
    if people.empty? || books.empty?
      puts "Either People or book List is empty. Please populate these lists in order to check rentals\n\n"
      return
    end

    puts 'Select a book from the following list:'
    @list_service.list_books(books, with_id: true)
    book_idx = @get_service.get_number('Book: ', 'Please enter a valid number!')

    puts 'Select a person from the following list:'
    @list_service.list_people(people, with_id: true)
    person_idx =
      @get_service.get_number('Borrower: ', 'Please enter a valid number!')
    date = @get_service.get_date('Date: ', 'Please enter a valid date!')

    begin
      person = people.at(person_idx)
      book = books.at(book_idx)
      Rental.new(date, book, person)
    rescue NoMethodError
      puts "Book or person not found. Please try again!\n\n"
      return add_rental(books, people)
    end
    puts "Rental Added!\n\n"
  end
end
