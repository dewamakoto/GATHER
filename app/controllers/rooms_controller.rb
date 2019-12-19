class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message =Message.new
    @messages = @room.messages
  end

  def create
    @room = Room.new(room_params)
  	@room.save
  	current_user.joins.create(room_id: @room.id)
  	redirect_to @room
  end

 	private
	def room_params
  		params.require(:room).permit(:name)
	end
end
