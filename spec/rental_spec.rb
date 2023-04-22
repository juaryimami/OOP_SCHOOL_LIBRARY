require_relative '../classes/rental'

describe Rental do
  it 'should initialize with a book, person, and date' do
    book = Book.new('The Catcher in the Rye', 'J.D. Salinger')
    person = Person.new('John Doe')
    date = '21/06/2022'

    rental = Rental.new(book, person, date)

    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
    expect(rental.date).to eq(date)
    expect(person.rentals).to include(rental)
    expect(book.rentals).to include(rental)
  end
end
