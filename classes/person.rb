require_relative './corrector'
require_relative './rental'

class Person
  attr_accessor :name, :age, :id, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @name = validate_name(name)
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

  def validate_name(name)
    @corrector.correct_name(name)
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end
end
