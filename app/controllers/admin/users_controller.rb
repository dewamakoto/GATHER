class Admin::UsersController < ApplicationController
  def index
    if admin_signed_in?
  		@search = User.ransack(params[:q])
    	@user_result = @search.result.page(params[:page]).per(30)
  	else
    	redirect_to root_path
  	end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'index'
    end
  end

  def edit
    if admin_signed_in?
  		@user = User.find(params[:id])
  	else
    	redirect_to root_path
  	end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:image,:favorite_sports,:favorite_sake)
  end
end
