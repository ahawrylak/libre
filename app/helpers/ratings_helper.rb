module RatingsHelper

  def current_user_has_voted?(book)
    !current_user.rated_books.find_by(id: book.id).nil?
  end

  def current_user_rate(book)
    book.ratings.find_by(user_id: current_user.id)
  end

end
