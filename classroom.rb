# classrooms section
class Classroom
  attr_accessor :@lebel
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
