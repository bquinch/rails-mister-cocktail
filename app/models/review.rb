class Review < ApplicationRecord
  RATINGS = (0..5).to_a
  belongs_to :cocktail
  validates :content, presence: true
  validates :author, presence: true
  validates :rating, presence: true, inclusion: { in: RATINGS }
end
