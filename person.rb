class Person 
    def initialize(age, name = 'Unknow', parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    
    attr_reader :id
    attr_accessor :name, :age
    
    def can_use_services?
         is_of_age? || @parent_permission ? true : false
    end
   
    private
        
    def is_of_age?
        if (@age >= 18) 
            return true
            else
            return false 
        end
        
    end

end