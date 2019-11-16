class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :author, presence: true
end
