require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @rating_params = { rating: { value: 5,
                                user: users(:user1),
                                book: books(:book1) } }
    assert Rating.new(@rating_params[:rating]).valid?
  end

  test 'should redirect create if not logged in' do
    assert_no_difference 'Review.count' do
      post ratings_url, params: @rating_params
    end
    assert_redirected_to new_user_session_url
  end

  test 'should redirect update if not logged in' do
    old_rating = ratings(:rating1)
    patch rating_url(old_rating), params: @rating_params
    assert_equal old_rating, old_rating.reload
    assert_redirected_to new_user_session_url
  end

  test 'should redirect update if not logged in as correct user' do
    other_user = users(:user2)
    old_rating = ratings(:rating1)
    sign_in other_user
    patch rating_url(old_rating), params: @rating_params
    assert_equal old_rating, old_rating.reload
    assert_not flash.empty?
  end

  test 'should successfuly update rating' do
    sign_in users(:user1)
    patch rating_url(ratings(:rating1)), params: @rating_params
    assert_equal @rating_params[:rating][:value], ratings(:rating1).value
  end

end
