require_relative '../classes/student'
require_relative '../classes/rental'
require_relative '../classes/book'

describe Student do
  age = 25
  name = 'Prianka'
  classroom = '303'
  let(:student) { Student.new age, name, true, classroom }
  let(:book) { Book.new name, classroom }

  it 'takes four parameters and return the Student object' do
    expect(student).to be_an_instance_of(Student)
  end

  it 'returns the correct age' do
    expect(student.age).to eq(age)
  end

  it 'returns the correct name' do
    expect(student.name).to eq(name)
  end

  it 'returns the correct classroom' do
    expect(student.classroom).to eq(classroom)
  end

  it 'returns the correct parent permission' do
    expect(student.parent_permission).to eq(true)
  end

  it 'returns the rental when runs add_rental method' do
    expect(student.add_rental(book, '2023/05/20')).to be_an_instance_of(Rental)
  end

  it 'returns the right book when runs add_rental method' do
    expect(student.add_rental(book, '2023/05/20').book).to eq(book)
  end
end
