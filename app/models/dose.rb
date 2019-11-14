class Dose < ApplicationRecord
  DESCRIPTIONS = ['1cl', '2cl', '3cl', 'a dash of', 'a ton of']
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, allow_blank: false, inclusion: { in: DESCRIPTIONS }
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
end
