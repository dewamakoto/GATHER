class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
    	search_path
  	end

	protected

		def  configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_address, :latitude, :longitude,:image_id,:favorite_sports,:favorite_sake])
	end
end
