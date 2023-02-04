require './nameable'
require './capitalize_decorator'

# Class Person
class Person < Nameable
  def initialize(age, name = 'Unkown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
