require_relative '../classes/person'

describe Person do
  age = 22
  name = 'Akasuma'
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
end
