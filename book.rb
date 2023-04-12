require_relative './rental'

# book class starts below
class Book
  attr_accessor :@title, @author, @rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(person, date)
    Rental.new(date, self, person)
  end
end
