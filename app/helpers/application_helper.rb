module ApplicationHelper

	def facebook_url
    	case Rails.env
    when "development"
      "https://www.facebook.com/dialog/oauth?client_id=2185436208425326&redirect_uri=https%3A%2F%2Flocalhost:3000%2Fusers%2Fauth%2Ffacebook%2Fcallback&scope=email"
    when "production"
      "https://www.facebook.com/dialog/oauth?client_id=2185436208425326&redirect_uri=https%3A%2F%2Fwww.2019gather.me%2Fusers%2Fauth%2Ffacebook%2Fcallback&scope=email"
    end
end
end
