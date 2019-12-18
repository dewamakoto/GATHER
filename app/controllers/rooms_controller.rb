class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    if Join.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @joins = @room.joins
    else
      redirect_to :show
    end
  end

  def create
    @room = Room.create
    @join1 = Join.create(:room_id => @room.id, :user_id => current_user.id)
    @join2 = Join.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
end
