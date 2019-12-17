class RelationshipsController < ApplicationController


def create
  user = User.find(params[:follow_id])
  following = current_user.follow(user)
  if following.save
    user.create_notification_follow(current_user)
    flash[:success] = '友達申請しました'
    redirect_to user_path(user)
  else
    flash.now[:alert] = '友達の申請に失敗しました'
    redirect_to user_path(user)
  end
 end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user_path(user)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user_path(user)
    end
  end

  def index

    @user = User.find(current_user.id)
    @friends = @user.friends
    jyogai_id = @friends.pluck(:id)
    @following = Relationship.where(user_id: current_user.id).where.not(follow_id: jyogai_id)
    @follow_user = Relationship.where(follow_id: current_user.id).where.not(user_id: jyogai_id)


  end

private


end
