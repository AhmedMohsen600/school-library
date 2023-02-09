class Boolean
  attr_reader :value

  def initialize(str)
    case str
    when 'y', 'yes', 'Yes', 'Y', 'YES'
      @value = true
    when 'n', 'no', 'No', 'N', 'NO'
      @value = false
    end
  end
end
