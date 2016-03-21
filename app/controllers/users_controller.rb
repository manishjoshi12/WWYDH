class UsersController < ApplicationController

 skip_before_action :ensure_login, only: [:new, :create, :confirm_email]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      UserMailer.registration_confirmation(@user).deliver
  		flash[:success] = "Sign up complete. Please check your email!"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to WWYDH! Your accout has been confirmed."
      redirect_to root_url
    else
      flash[:error] = "User does not exist."
      redirect_to root_url
    end
  end



	private

	def user_params
		params.require(:user).permit(:firstname, :lastname, :email, :password,
                                 :password_confirmation)
	end

end
