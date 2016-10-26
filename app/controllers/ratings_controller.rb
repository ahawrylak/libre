class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    rating = current_user.ratings.build(rating_params)
    if rating.save
      flash[:notice] = "Thanks for your rating!"
    else
      flash[:alert] = "Couldn't rate the book!"
    end
    redirect_to :back
  end

  def destroy
    Rating.find_by(id: params[:id]).destroy
    flash[:notice] = "Your rating was deleted. Now you can rate again."
    redirect_to :back
  end

private

    def rating_params
      params.require(:rating).permit(:book_id, :value)
    end

    def correct_user
      rating = Rating.find(params[:id])
      unless rating.user == current_user
        flash[:alert] = "You cannot change other user's rating!"
        redirect_to book_url(rating.book )
      end
    end

end
