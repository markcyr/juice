class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session


  private

  def not_authenticated
    redirect_to login_url, :alert => "login First"
  end
end
