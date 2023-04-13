class ShowInformation
  def all_books(books)
    books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def all_people(people)
    people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def get_rental_id(rentals)
    print 'ID of person: '
    id = gets.chomp
    rentals.filter { |rental| rental.person.id == id.to_i }
  end

  def all_rentals_id(rentals)
    puts 'Rentals: '
    get_rental_id(rentals).each do |rental|
      puts "Date: #{rental.date}, Book:\"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
