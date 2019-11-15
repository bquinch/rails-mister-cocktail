class Dose < ApplicationRecord
  DESCRIPTIONS = ['1cl', '2cl', '3cl', 'a dash of', 'a ton of']
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, inclusion: { in: DESCRIPTIONS }
  validates :cocktail, uniqueness: { scope: :ingredient }
end
