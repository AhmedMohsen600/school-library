require 'rspec'
require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'sets the specialization' do
      teacher = Teacher.new('math', 30, 'John Doe')
      expect(teacher.instance_variable_get(:@specialization)).to eq('math')
    end

    it 'sets the age' do
      teacher = Teacher.new('math', 30, 'John Doe')
      expect(teacher.age).to eq(30)
    end

    it 'sets the name' do
      teacher = Teacher.new('math', 30, 'John Doe')
      expect(teacher.name).to eq('John Doe')
    end

    it 'sets the parent permission' do
      teacher = Teacher.new('math', 30, 'John Doe', parent_permission: true)
      expect(teacher.instance_variable_get(:@parent_permission)).to be(true)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new('math', 30, 'John Doe', parent_permission: true)
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
