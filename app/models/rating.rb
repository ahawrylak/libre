class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book


  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :value, presence: true, numericality: { only_integer: true,
                                                    greater_than_or_equal_to: 1,
                                                    less_than_or_equal_to: 5 }
  validates_associated :user, :book
  validates_uniqueness_of :book_id, scope: :user_id


private


end
