class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, current_user_id)
  	binding.pry
  	current_user = User.find(current_user_id)
    ActionCable.server.broadcast 'room_channel', comment: render_message(message)
  end

  private
    def render_message(message)
    	binding.pry
    	 ApplicationController.render_with_signed_in_user(current_user, partial: 'messages/message', locals: { message: message })
    	# ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message})
    end
end
