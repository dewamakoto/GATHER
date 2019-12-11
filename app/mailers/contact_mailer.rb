class ContactMailer < ApplicationMailer
	def send_when_admin_reply(user, contact,reply)
   	 	@user = user
    	@answer = reply.body
   	 	mail to: @user.email, subject: "【GATHER】 #{reply.title}"
  	end
end
