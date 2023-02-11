require_relative './nameable'
require_relative './rental'

# Class Person
class Person
  attr_reader :age, :name, :parent_permission, :rentals, :id

  def initialize(age, name, parent_permission: false)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    age >= 18 || parent_permission
  end

  def add_rental(rental)
    @rentals << rental
  end
end
