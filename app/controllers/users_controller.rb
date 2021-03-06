class UsersController < ApplicationController


  def index

  end

  def show
   @user = User.find(params[:id])
     @recipes = @user.recipes.paginate(:page => params[:page], :per_page =>3)

  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
         flash[:success] = 'Welcome!'
        auto_login(@user)
        redirect_to root_path
           else
        render 'new'
      end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def edit
  end

private

def user_params
 params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
end


end
