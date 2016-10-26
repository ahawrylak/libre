require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @rating_params = { rating: { value: 5,
                                user: users(:user1),
                                book: books(:book1) } }
  end

  test 'should redirect create if not logged in' do
    assert_no_difference 'Review.count' do
      post ratings_url, params: @rating_params
    end
    assert_redirected_to new_user_session_url
  end


end
