class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @user_name = @user_name.find(params_id)
   @recipe.order(:created_at).reverse
  end

  def create
    @recipe = Recipe.new()
    @recipe.user = current_user
  end
private
  def recipe_params
    params.require(:recipe).[permit :name, :image, :user_id]

  end
end
