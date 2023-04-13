require_relative '../classes/rental'
require_relative '../classes/student'
require_relative '../classes/book'

describe Rental do
  date = '2023/05/21'
  name = 'Seid'
  title = 'Lord of Loros'
  let(:book) { Book.new title, name }
  let(:teacher) { Student.new(24, name) }
  let(:rental) { Rental.new(book, teacher, date) }

  it 'takes three parameters and returns a Rental object' do
    expect(rental).to be_an_instance_of(Rental)
  end

  it 'returns the right person' do
    expect(rental.person).to eq(teacher)
  end

  it 'returns the right book' do
    expect(rental.book).to eq(book)
  end
end
