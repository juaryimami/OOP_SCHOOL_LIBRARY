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
    expect(person.person_type).to eq('student')
    expect(person.rentals).to eq([])
  end
end
