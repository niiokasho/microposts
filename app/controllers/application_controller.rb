class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def create
   @user = User.new(user_params)
   if @user.save
     redirect_to root_path , notice: 'ログインしました'
   else
   @user = User.all
   flash.now[:alert] = "ログインに失敗しました。"
   render 'index'
   end
  end
  
end