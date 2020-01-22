class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, current_user_id)
  	current_user = User.find(current_user_id)
    ActionCable.server.broadcast 'room_channel', message: render_message(message,current_user)
  end

  private
    def render_message(message)
    	 ApplicationController.render_with_signed_in_user(current_user, partial: 'messages/message', locals: { message: message })
    	# ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message})
    end
end
