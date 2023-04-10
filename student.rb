require_relative './person'

class Student < Person
  def initialize(age, classrooms, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classrooms = classrooms
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
