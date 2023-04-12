require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'

# here is the top level documentaion
class Person < Nameable
  def initialize(age, name = 'unknown', parent_premission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_premission = parent_premission
    @rental = []
  end

  private

  def is_of_age?
    @age >= 18
  end

  public

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  def add_rentals(date, book)
    Rental.new(date, book, self)
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name # ===> maximilianus (initial name not capitalize)
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name # ==> Maximilianus
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name # ==> Maximilian
