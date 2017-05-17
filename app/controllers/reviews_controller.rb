class ReviewsController < ApplicationController
before_action :load_recipe

  def show
    @review = Review.find(params[:id])
  end

  def create
    # @review = Review.new
    # @recipe = Recipe.find(params[:recipe.id])
    @review = @recipe.reviews.build(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      format.html do
        if request.xhr?
          if @review.save
            render partial: 'single_review', locals: {review: @review}
          else
            render 'recipes/show'
          end
        else
          if @review.save
            redirect_to recipe_path(@recipe)
          else
            render 'recipes/show'
          end
        end
      end

      format.json do
        if @review.save
          render json: @review
        else
          render 'recipes/show'
        end
      end
    end
  end
    # if request.xhr?
    #   if @review.save
    #     render partial: 'single_review'
    #   end
    #
    #
    # else
    #     if @review.save
    #              redirect_to 'recipes/show' , notice: 'Review created successfully'
    #            else
    #              render 'recipe/show'
    #     end
    # end
  # end
private

  def review_params
    params.require(:review).permit(:comment, :recipe_id, :user_id, :rating)
  end
  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
