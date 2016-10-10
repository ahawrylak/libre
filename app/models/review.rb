class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates_associated :user, :book

end
