require_relative '../classes/book'

class CreateBook
  def title_selection
    print 'Title: '
    gets.chomp
  end

  def author_selection
    print 'Author: '
    gets.chomp
  end

  def create_book(books)
    book = Book.new(title_selection, author_selection)
    books << book unless books.include?(book)
    puts 'Book created successfully'
  end
end
