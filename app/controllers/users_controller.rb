class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    # addtest
    if user_signed_in?
      @room = Room.new
    end
  end

  def edit
    @user = current_user
  end

  def exit
  	@user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "アカウント情報の更新に成功しました。"
      redirect_to user_path(user.id)
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:image,:favorite_sports,:favorite_sake)
  end

  def currect_user
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user.id)
    end
  end
end
