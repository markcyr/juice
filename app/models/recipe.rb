class Recipe < ApplicationRecord
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :reviews
  has_many :users, through: :reviews

  belongs_to :user
  accepts_nested_attributes_for :ingredients_recipes


  def iron
    iron_array = []
    joint_record = self.ingredients_recipes
    joint_record.each do |ingredient_recipe|
    q = ingredient_recipe.quantity
    f = ingredient_recipe.ingredient.iron_mg
    iron_array << q*(f/100.0)
    end
    return iron_array.sum
  end


end




# <% @recipe.ingredients_recipes.each do |ingredient_recipe| %>
# Name:<%= ingredient_recipe.ingredient.name %> ,
# <%= ingredient_recipe.quantity %><br>
# Water: <%= ingredient_recipe.ingredient.water_g %>gms<br>
