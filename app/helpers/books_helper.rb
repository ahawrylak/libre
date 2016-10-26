module BooksHelper

# Returns book's average rating - #TODO optimize this
  def average_rating(book)
    ratings_array = book.ratings.pluck(:value)
    ratings_array.inject(:+).to_f / ratings_array.length
  end

end
