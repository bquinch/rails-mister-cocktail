class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
end
