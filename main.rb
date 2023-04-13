require_relative './app'

def main
  app = App.new
  status = true
  puts 'Welcome to School Library App!'
  while status
    option = app.ui_init

    case option
    when '1'
      ShowInformation.new.all_books(app.books)
    when '2'
      ShowInformation.new.all_people(app.people)
    when '3'
      CreatePerson.new.create_person(app.people)
    when '4'
      CreateBook.new.create_book(app.books)
    when '5'
      CreateRental.new.create_rental(app.books, app.people, app.rentals)
    when '6'
      ShowInformation.new.all_rentals_id(app.rentals)
    when '7'
      puts 'Thank you for using this app!'
      puts
      app.save_data
      status = false
    else
      puts 'Sorry, you choose a wrong option'
      puts
    end
  end
end

main
