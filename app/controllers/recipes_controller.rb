class RecipesController < ApplicationController
  before_action :require_login, only: [:new, :show]

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients_recipes.build
  end

  def index
    # @search = Recipe.search(params[:q])
    # @recipes = @search.result
    # Ingredients.find(params[:name])
    if (params[:query] != "")
      @recipes = Recipe.joins(:ingredients).where("ingredients.name LIKE ? OR recipes.name LIKE ?" ,"%#{params[:query]}%".upcase,"%#{params[:query]}%").distinct
      # @recipes = Recipe.where("%#{params[:ingredient_name]}%")
    else
      @recipes = Recipe.all.order(:created_at)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews.order(:created_at).reverse
    @review = @recipe.reviews.build

    # @user_name = @user_name.find(params_id)
  #  @recipe.order(:created_at).reverse
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.ingredients_recipes.build
    # @recipe.ingredients.build
  end
private
  def recipe_params
    params.require(:recipe).permit(:name, :image, :user_id)

  end

end
# <!-- <div>
#   <%=f.fields_for :ingredients_recipes do |r|%>
#     <%= render 'ingredients_recipe_fields', :f => r %>
#   <%end%>
# </div> -->
