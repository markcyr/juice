class RecipesController < ApplicationController
  before_action :require_login, only: [:new, :show]

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients_recipes.build
  end

  def index
      if ( params[ :query ] && params[ :query ] != "" )
        queryArr = params[ :query ].split( " " )

        allResults = [];

        queryArr.each do | queryTerm |
          results = Recipe.joins( :ingredients ).where( "recipes.name LIKE ? OR ingredients.name LIKE ?",  "%#{queryTerm}%".upcase, "%#{queryTerm}%".upcase )

          allResults = allResults.concat( results )
        end
        @recipes = allResults.uniq
      else
        @recipes = Recipe.all
      end
    end

  def show
    @recipe = Recipe.find(params[:id])

    # @reviews = @recipe.reviews.order(:created_at).reverse
    # @review = @recipe.reviews.build

    if current_user

      @review = @recipe.reviews.build

    end
    # @user_name = @user_name.find(params_id)
  #  @recipe.order(:created_at).reverse
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # @recipe.ingredients.build
      @recipe.user_id = current_user.id
    puts "PARAMS NAME #{params[:recipe][:name]}"
    puts "PARAMS IMAGE #{params[:recipe][:image]}"
    puts "PARAMS USER ID #{params[:recipe][:user_id]}"

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end

  end
private
  def recipe_params
    params.require(:recipe).permit(:name, :image, :user_id, ingredients_recipes_attributes: [:ingredient_id, :quantity, :unit_id])

  end

end
# <!-- <div>
#   <%=f.fields_for :ingredients_recipes do |r|%>
#     <%= render 'ingredients_recipe_fields', :f => r %>
#   <%end%>
# </div> -->
