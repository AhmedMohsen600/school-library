require_relative "person"
require_relative "book"
require_relative "classroom"
require_relative "student"
require_relative "rental"
require_relative "teacher"
require "date"
require_relative "./list_service"
require_relative "./get_service"
require_relative "./create_service"

class App
  def initialize
    @books = []
    @people = []
    @get_service = Get_serivce.new
    @create_service = Create_service.new(@people, @books)
    puts "Welcome to School Library App!\n\n"
  end

  def run
    loop do
      puts main_section
      choice = @get_service.get_number("", "Please enter a valid number!")
      return if choice == 7

      run_available_options(choice)
    end
  end

  private

  def run_available_options(choice)
    service_class = List_service.new
    case choice
    when 1
      service_class.list_books(@books)
    when 2
      service_class.list_people(@people)
    when 3
      @create_service.add_person
    when 4
      @books << @create_service.add_book
    when 5
      @create_service.add_rental(@books, @people)
    when 6
      service_class.list_rentals(@people)
    else
      puts ""
    end
  end

  def main_section
    "Please choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person
7 - Exit"
  end
end
