require 'test_helper'

class RatingTest < ActiveSupport::TestCase

  def setup
    @rating = ratings(:rating1)
    assert @rating.valid?
  end

  test 'rating should be assocciated with user' do
    @rating.user = nil
    assert_not @rating.valid?
  end

  test 'rating should be assocciated with book' do
    @rating.book = nil
    assert_not @rating.valid?
  end

  test 'value should be present' do
    @rating.value = nil
    assert_not @rating.valid?
  end

  test 'value should be between 1 and 5' do
    @rating.value = 0
    assert_not @rating.valid?
    @rating.value = 6
    assert_not @rating.valid?
  end


end
