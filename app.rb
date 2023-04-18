require_relative './subclasses/create_person'
require_relative './subclasses/create_book'
require_relative './subclasses/create_rentals'
require_relative './subclasses/show_info'
require_relative './classes/book'
require_relative './classes/student'
require_relative './classes/teacher'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize()
    @books = load_data_books
    @people = load_data_people
    @rentals = load_data_rentals
  end

  def load_data_books
    file = File.open('./data/books.json', 'a+')
    show = File.read('./data/books.json')
    if show != ''
      file.close
      return JSON.parse(show, create_additions: true).map do |book|
        Book.new(book['title'], book['author'])
      end
    end
    file.close
    []
  end

  def load_data_people
    file = File.open('./data/people.json', 'a+')
    show = File.read('./data/people.json')
    if show != ''
      file.close
      list_people = JSON.parse(show, create_additions: true).map do |person|
        case person['tipo']
        when 'Student'
          student = Student.new(person['age'], person['name'], parent_permission: person['parent_permision'])
          student.id = person['id']
          student
        when 'Teacher'
          teacher = Teacher.new(person['age'], person['specialization'], person['name'])
          teacher.id = person['id']
          teacher
        end
      end
      return list_people
    end
    file.close
    []
  end

  def load_data_rentals
    file = File.open('./data/rentals.json', 'a+')
    show = File.read('./data/rentals.json')
    if show != ''
      file.close
      list_rentals = JSON.parse(show, create_additions: true).map do |rental|
        book_feature = @books.filter do |book|
          book.title == rental['book']['title'] && book.author == rental['book']['author']
        end
        person_feature = @people.filter { |person| person.id == rental['person']['id'] }
        Rental.new(book_feature[0], person_feature[0], rental['date'])
      end
      return list_rentals
    end
    file.close
    []
  end

  def rental_data
    @rentals.map do |rental|
      if rental.person.instance_of?(Student)
        { date: rental.date, book: { title: rental.book.title, author: rental.book.author },
          person: { tipo: rental.person.class, name: rental.person.name, id: rental.person.id, age: rental.person.age,
                    parent_permission: rental.person.parent_permission,
                    classroom: rental.person.classroom } }
      elsif rental.person.instance_of?(Teacher)
        { date: rental.date, book: { title: rental.book.title, author: rental.book.author },
          person: { tipo: rental.person.class, name: rental.person.name, id: rental.person.id, age: rental.person.age,
                    parent_permission: rental.person.parent_permission, specialization: rental.person.specialization } }
      end
    end
  end

  def people_data
    @people.map do |person|
      if person.instance_of?(Student)
        { tipo: person.class, name: person.name, id: person.id, age: person.age,
          parent_permission: person.parent_permission, classroom: person.classroom }
      elsif person.instance_of?(Teacher)
        { tipo: person.class, name: person.name, id: person.id, age: person.age,
          parent_permission: person.parent_permission, specialization: person.specialization }
      end
    end
  end

  def book_data
    @books.map do |book|
      { title: book.title, author: book.author }
    end
  end

  def save_data
    File.write('./data/books.json', JSON.generate(book_data))
    File.write('./data/people.json', JSON.generate(people_data))
    File.write('./data/rentals.json', JSON.generate(rental_data))
  end

  def ui_init
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    gets.chomp
  end
end
