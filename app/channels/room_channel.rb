class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(content)
    message = Message.new(content: content['content'][0], user_id: content['content'][1].to_i, room_id: content['content'][2].to_i)
    message.save
    message.create_notification_message!(current_user, message.id)
    # Post.create(message: message['message'])
    ActionCable.server.broadcast 'room_channel', content: render_message(message)
    # フロントへ返します
  end

  private
    def render_message(message)
      ApplicationController.render_with_signed_in_user(current_user,partial: 'messages/message', locals: { message: message })
      # ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message})
    end
end
