class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def created
    @recipe = Recipe.find(params[:recipe.id])
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to recipes_path,
      notice: 'Review created succesfully'
    else
      render 'recipes/show
    end'
  end






  private

  def review_params
    params.require(:review).permit(:comment, :recipe_id)
  end
  def
    @recipe.find(params[:recipe_id])
  end
end
