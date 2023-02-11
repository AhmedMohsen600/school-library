require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('A1') }
  let(:student) { double('student') }

  describe '#initialize' do
    it 'sets the label' do
      expect(classroom.label).to eq('A1')
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds the student to the students array' do
      student = double('student', classroom: nil)
      allow(student).to receive(:classroom=).with(classroom)

      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
