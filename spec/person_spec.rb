require_relative '../classes/person'

describe Person do
  age = 22
  name = 'Akuma'
  let(:person) { Person.new age, name }

  it 'takes two parameter and return the Person object' do
    expect(person).to be_an_instance_of(Person)
  end

  it 'returns the correct age' do
    expect(person.age).to eq(age)
  end

  it 'returns the correct name' do
    expect(person.name).to eq(name)
  end
  it 'creates a new Person object with default values' do
    expect(person.parent_permission).to eq(true)
    expect(person.can_use_services?).to eq(true)
    expect(person.rentals).to eq([])
  end
  it 'The validate_name method corrects the name' do
    person = Person.new(20, 'nameTest')
    person.validate_name(person.name)
    expect(person.name).to eql 'Nametest'
  end
  it 'The add_rental method returns a rental and adds its to the book' do
    book = Book.new('Love Till Death', 'Hadis Alemayehu')
    person = Person.new(24, 'Markon')

    rental = person.add_rental(book, '2023-05-04')

    expect(person.rentals).to eql [rental]
  end
end
