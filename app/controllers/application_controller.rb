class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
    	search_path
  	end

	protected

		def  configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_address, :latitude, :longitude,:image_id,:favorite_sports,:favorite_sake])
	end

	def after_sign_in_path_for(resource_or_scope)
		if resource_or_scope.is_a?(Admin)
			admin_bars_path
		else
			search_path
		end
	end

	def self.render_with_signed_in_user(user, *args)
   		ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
   		proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
   		renderer = self.renderer.new('warden' => proxy)
   		renderer.render(*args)
 	end
end
