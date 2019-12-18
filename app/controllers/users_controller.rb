class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    # addtest
    @current_user_join=Join.where(user_id: current_user.id)
    @user_join=Join.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @current_user_join.each do |f|
        @user_join.each do |t|
          if f.room_id == t.room_id then
            @match = true
            @room_id = f.room_id
          end
        end
      end
      if @match
      else
        @room = Room.new
        @join = Join.new
      end
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
