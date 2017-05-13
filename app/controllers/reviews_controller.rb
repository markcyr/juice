class ReviewsController < ApplicationController
before_action :load_recipe

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new
    # @recipe = Recipe.find(params[:recipe.id])
    @review = @recipe.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
                 redirect_to 'recipes/show' , notice: 'Review created successfully'
               else
                 redirect_to 'recipe/show', notice: 'Review didnt go'

               end
    end

private

  def review_params
    params.require(:review).permit(:comment, :recipe_id, :user_id, :rating)
  end
  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
