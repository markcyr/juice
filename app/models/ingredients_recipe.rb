class IngredientsRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit
  validates :quantity, numericality: { greater_then: 0 }
end
