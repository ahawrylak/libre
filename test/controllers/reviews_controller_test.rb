require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest


  test 'should redirect new when not signed in' do
    get reviews_new_url
    assert_redirected_to new_user_session_url
  end

  test 'should redirect create when not signed in' do
    review_params = { review: { content: "I liked this book a lot.",
                                user: users(:user1),
                                book: books(:book1) } }
    assert_no_difference 'Review.count' do
      post reviews_url, params: review_params
    end
    assert_not flash[:alert].empty?
    assert_redirected_to new_user_session_url
  end

  test 'should redirect destroy when not signed in' do
    assert_no_difference 'Review.count' do
      delete review_url(reviews(:review1))
    end
    assert_not flash[:alert].empty?
    assert_redirected_to new_user_session_url
  end

  test 'should not allow user deleting others review' do
    review = reviews(:review1)
    other_user = users(:user2)
    assert_not_equal other_user, review.user
    sign_in other_user
    assert_no_difference "Review.count" do
      delete review_url(review)
    end
    assert_not flash[:alert].empty?
  end


end
