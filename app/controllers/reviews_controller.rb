class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

   def new
     @review = Review.new
   end

  def create
    review = Book.find(params[:book_id]).reviews.build(review_params)
    review.user_id = current_user.id
    if review.save
      flash[:notice] = "Your review has been successfully added"
    else
      flash[:alert] = "Couldn't add review"
    end
    redirect_to :back
  end

  def destroy
    deleted_review = Review.find(params[:id]).destroy
    related_book = deleted_review.book
    flash[:notice] = "Review deleted!"
    redirect_to book_url(related_book)
  end

private

    def review_params
      params.require(:review).permit(:content)
    end

    def correct_user
      review = Review.find(params[:id])
      unless review.user == current_user
        flash[:alert] = "You cannot delete other user's posts"
        redirect_to book_url(review.book )
      end
    end

end
