class Recipe < ApplicationRecord
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :reviews
  has_many :users, through: :reviews

  belongs_to :user
  accepts_nested_attributes_for :ingredients_recipes


  # def get_nutrient
  #   nutrients = ['iron', 'calcium']
  #   nutrition = {}
  #   nutrition[n[0]] = total
  #   case
  #   # --- iron calculation
  #   nutrient_ingredient = []
  #   joint_record = self.ingredients_recipes
  #   joint_record.each do |ingredient_recipe|
  #   q = ingredient_recipe.quantity
  #   u = ingredient_recipe.unit.unit_name
  #     case u
  #     when "gr"
  #       g = 1
  #     when "cup"
  #       g = 250
  #     when "oz"
  #       g = 29.58
  #     when "lb"
  #       g = 454
  #     end
  #   v = ingredient_recipe.ingredient.iron_mg
  #   nutrient_ingredient << ((q*g)*(v/100)).round(2)
  #   # iron is in units of mg
  #   end
  #   # return nutrient_array.sum
  #   total = nutrient_array.sum
  #
  #   return nutrition
  # end

  def calcium
    
    calcium_array = []
    joint_record = self.ingredients_recipes
    joint_record.each do |ingredient_recipe|
    q = ingredient_recipe.quantity
    v = ingredient_recipe.ingredient.calcium_mg
    calcium_array << q*(v/100).round(2)
    # calcium is in units of mg
    end
    return calcium_array.sum

  end
end
