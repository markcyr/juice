class Recipe < ApplicationRecord
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :reviews
  has_many :users, through: :reviews

  belongs_to :user
  accepts_nested_attributes_for :ingredients_recipes

  # def water
  #
  #  @recipe.ingredients_recipes.each do |ingredient_recipe|
  #
  #    amount = ingredient_recipe.quantity
  #
  #    total_water = ingredient_recipe.ingredient.water_g
  #
  #    return amount * total_water
  #
  #
  # end
end




# <% @recipe.ingredients_recipes.each do |ingredient_recipe| %>
# Name:<%= ingredient_recipe.ingredient.name %> ,
# <%= ingredient_recipe.quantity %><br>
# Water: <%= ingredient_recipe.ingredient.water_g %>gms<br>
