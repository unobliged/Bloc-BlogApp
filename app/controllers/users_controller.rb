class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
  end

  def edit
    redirect_to edit_user_registration_path
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: "Account successfully updated."
    else
      redirect_to @user, notice: "Error: Account not updated."
    end
  end

end
