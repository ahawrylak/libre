class Book < ApplicationRecord
  before_validation :default_values
  has_many :reviews
  has_many :ratings, dependent: :destroy

  validates :author, presence: true,
                     length: { maximum: 69 }
  validates :title, presence: true,
                    length: { maximum: 199 }
  validates :pub_year, presence: true,
                       numericality: { only_integer: true,
                                       greater_than_or_equal_to: 0,
                                       less_than_or_equal_to: 2020 }
  validates :description, length: { maximum: 1999 }



  private

    def default_values
      if self.description.blank? || self.description.nil?
        self.description = "No description"
      end
    end

end
