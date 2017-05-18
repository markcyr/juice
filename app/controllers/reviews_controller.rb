class ReviewsController < ApplicationController
  before_action :load_recipe

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @recipe.reviews.new(review_params)
    @review.user = current_user
    @review.save
    render json: { review: @review, errors: @review.errors.full_messages, reviewer: @review.user.user_name}
  end

private

  def review_params
    params.require(:review).permit(:comment, :recipe_id, :user_id, :rating)
  end

  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end
