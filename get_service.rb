require_relative "./boolean"

class Get_serivce
  def get_str(param_name, error = "")
    print param_name
    input = gets.chomp

    if input.length > 50 || input.length < 3
      puts error
      return get_str(param_name, error)
    end
    input
  end

  def get_number(param_name, error = "")
    print param_name
    input = gets.chomp
    converted = input.to_i

    unless converted.positive? || input == "0"
      puts error
      return get_number(param_name, error)
    end
    converted
  end

  def get_bool(param_name, error = "")
    print param_name
    input = gets.chomp
    input = Boolean.new(input).value

    unless [true, false].include?(input)
      puts error
      return get_bool(param_name, error)
    end
    input
  end

  def get_date(param_name, error = "")
    print param_name
    input = gets.chomp

    begin
      Date.parse(input)
    rescue Date::Error
      puts error
      get_date(param_name, error)
    end
  end
end
