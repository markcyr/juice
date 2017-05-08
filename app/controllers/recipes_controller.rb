class RecipesController < ApplicationController
  def index
    @search = Recipe.search(params[:q])
    @recipes = @search.result
  end
end
