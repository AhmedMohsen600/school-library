require 'rspec'
require_relative '../person'

describe Person do
  let(:person) { Person.new(20, 'John Doe') }

  describe '#initialize' do
    it 'has an age' do
      expect(person.age).to eq(20)
    end

    it 'has a name' do
      expect(person.name).to eq('John Doe')
    end

    it 'has parent permission set to false by default' do
      expect(person.parent_permission).to be false
    end
  end

  describe '#can_use_services?' do
    context 'when the person is 18 years or older' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is under 18 years old' do
      let(:person) { Person.new(17, 'Jane Doe', parent_permission: true) }

      it 'returns true when the person has parent permission' do
        expect(person.can_use_services?).to be true
      end
    end
  end
end
