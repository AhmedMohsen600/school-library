require './base_decorater'

# Capitalize Decorator class
class CapitalizeDecorator < BaseDecorater
  def correct_name
    @nameable.correct_name.capitalize
  end
end
