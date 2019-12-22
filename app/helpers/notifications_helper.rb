module NotificationsHelper

	def notification_form(notification)
 		@comment=nil
  		visitor=link_to notification.visitor.name, notification.visitor, style:"font-weight: bold;"
  		your_post=link_to 'あなたの投稿' ,posts_path(notification.visited), style:"font-weight: bold;"
	case notification.action
		when "follow" then
			"あなたに友達申請しました"
    	when "comment" then
    	@comment=Comment.find_by(id:notification.comment_id)&.body
    	"#{your_post}にコメントしました"
    	when "message" then
    	@message=Message.find_by(id:notification.message_id)&.content
    	"あなたにメッセージを送信しました"
	end
	end

	def unchecked_notifications
    	@notifications = current_user.passive_notifications.where(checked: false)
  	end
end
