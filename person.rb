require 'timmer_decorator'
require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'rental'


class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end
end
person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmedperson = TrimmerDecorator.new(capitalizedPerson)
capitalized_trimmedperson.correct_name
