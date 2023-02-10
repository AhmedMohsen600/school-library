require_relative 'person'
require_relative 'book'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require 'date'
require_relative './list_service'
require_relative './get_service'
require_relative './create_service'
require_relative './fetch_service'

class App
  def initialize
    @fetch_service = FetchService.new
    @books = []
    @people = []
    @rentals = []
    @get_service = GetSerivce.new
    @create_service = CreateService.new(@people, @books)
    puts "Welcome to School Library App!\n\n"
  end

  def run
    loop do
      puts main_section
      choice = @get_service.get_number('', 'Please enter a valid number!')
      return if choice == 7
      @books = @fetch_service.fetch_books || []
      @people = @fetch_service.fetch_person || []
      @rentals = @fetch_service.fetch_rentals || []
      run_available_options(choice)
    end
  end

  private

  def run_available_options(choice)
    service_class = ListService.new
    case choice
    when 1
      service_class.list_books(@books)
    when 2
      service_class.list_people(@people)
    when 3
      @create_service.add_person
    when 4
      @create_service.add_book
    when 5
      @create_service.add_rental(@books, @people)
    when 6
      service_class.list_rentals(@people, @rentals)
    else
      puts ''
    end
  end

  def main_section
    'Please choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person
7 - Exit'
  end
end
