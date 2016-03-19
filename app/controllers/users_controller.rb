class UsersController < ApplicationController
 skip_before_action :ensure_login, only: [:new, :create]
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome!"
  		redirect_to root_path
  	else
  		render 'new'

  	end
  end

  	private
  	def user_params
  		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  	end
end
