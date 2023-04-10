# here is the top level documentaion
class Person
  def initialize(age, name = "unknown", parent_premission = true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_premission = parent_premission
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
end
