require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  label = 'B201'
  name = 'seid'
  age = '12'
  let(:classroom) { Classroom.new(label) }
  let(:student) { Student.new(age, name) }

  it 'takes one parameter and returns a Classroom object' do
    expect(classroom).to be_an_instance_of(Classroom)
  end

  it 'student should have the same classroom' do
    classroom.add_student(student)
    expect(student.classroom).to eq(classroom)
  end
end
