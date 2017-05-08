class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe =  Recipe.new
    @recipe.ingredients_recipes.build
  end

end
