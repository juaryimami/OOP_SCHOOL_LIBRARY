require_relative '../classes/student'
require_relative '../classes/teacher'

class CreatePerson
  def pick_name
    print 'Name: '
    gets.chomp
  end

  def pick_age
    print 'Age: '
    gets.chomp
  end

  def permission?
    print 'Has parent permission? [Y/N]: '
    has_parent_permission = gets.chomp
    has_parent_permission.downcase == 'y'
  end

  def pick_specialization
    print 'Specialization: '
    gets.chomp
  end

  def create_person(people)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option_person = gets.chomp
    case option_person
    when '1'
      person = Student.new(pick_age, pick_name, parent_permission: permission?)
    when '2'
      age = pick_age
      name = pick_name
      specialization = pick_specialization
      person = Teacher.new(age, specialization, name)
    else
      puts 'Sorry, you choose a wrong option'
      return
    end
    people << person
    puts 'Person created successfully'
  end
end
