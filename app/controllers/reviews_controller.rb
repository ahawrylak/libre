class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def new
    @review = Review.new
  end

  def create
    
  end

  def destroy
    deleted_review = Review.find(params[:id]).destroy
    related_book = deleted_review.book
    flash[:notice] = "Review deleted!"
    redirect_to book_url(related_book)
  end

private

    def correct_user
      review = Review.find(params[:id])
      unless review.user == current_user
        flash[:alert] = "You cannot delete other user's posts"
        redirect_to book_url(review.book )
      end
    end

end
