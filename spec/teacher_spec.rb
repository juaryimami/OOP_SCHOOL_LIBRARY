require_relative '../classes/teacher'
require_relative '../classes/rental'
require_relative '../classes/book'

describe Teacher do
  age = 555
  name = 'Mohammed'
  specialization = 'Biology'
  let(:teacher) { Teacher.new age, specialization, name, true }
  let(:book) { Book.new name, specialization }

  it 'takes four parameters and return the Teacher object' do
    expect(teacher).to be_an_instance_of(Teacher)
  end

  it 'returns the correct age' do
    expect(teacher.age).to eq(age)
  end

  it 'returns the correct name' do
    expect(teacher.name).to eq(name)
  end

  it 'returns the correct specialization' do
    expect(teacher.specialization).to eq(specialization)
  end

  it 'returns the correct parent permission' do
    expect(teacher.parent_permission).to eq(true)
  end

  it 'returns the rental when runs add_rental method' do
    expect(teacher.add_rental(book, '2023/05/20')).to be_an_instance_of(Rental)
  end

  it 'returns the right book when runs add_rental method' do
    expect(teacher.add_rental(book, '2023/05/20').book).to eq(book)
  end
end
