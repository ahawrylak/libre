require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

    def setup
      @review = Review.new(content: "XDXDDXDX",
                           user_id: users(:user1).id,
                           book_id: books(:book1).id)
      assert @review.valid?
    end

    test 'content should exist' do
      @review.content = nil
      assert_not @review.valid?
    end

    test 'content should not be blank' do
      @review.content = ' '
      assert_not @review.valid?
    end

    test 'review should be assigned to user' do
      @review.user_id = nil
      assert_not @review.valid?
    end

    test 'review should be assigned to book' do
      @review.book_id = nil
      assert_not @review.valid?
    end

end
