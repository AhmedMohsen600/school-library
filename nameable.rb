# Nameable Class
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method #{method}"
  end
end
