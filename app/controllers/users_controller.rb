class UsersController < ApplicationController
  def index
  	session[:user_id] = nil
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}"
  	else

  		redirect_to "/users"
  	end
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	
  	if @user.update_attributes(user_params)
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/users/#{@user.id}/edit"
  	end
  end
  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  		session[:user_id] = nil
  		redirect_to "/users"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/users/#{@user.id}/edit"
  	end
  end

  

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
