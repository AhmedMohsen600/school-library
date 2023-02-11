require_relative '../student'

describe '#classroom=' do
  let(:student) { Student.new(21, 'John') }
  let(:classroom) { double('classroom') }

  it 'sets the classroom' do
    allow(classroom).to receive(:students).and_return([])
    student.classroom = classroom
    expect(student.classroom).to eq(classroom)
  end

  it 'adds the student to the classroom students array' do
    allow(classroom).to receive(:students).and_return([])
    student.classroom = classroom
    expect(classroom.students).to include(student)
  end
end
