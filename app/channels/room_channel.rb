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
    # Post.create(message: message['message'])
    ActionCable.server.broadcast 'room_channel', content: content['content'][0]
    # フロントへ返します
  end
end
