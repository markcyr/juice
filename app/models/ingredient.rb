class Ingredient < ApplicationRecord
  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes


  def measure
  [gmwt_desc1, gmwt_desc2, gmwt_desc3, gmwt_desc4].compact
  end
end
