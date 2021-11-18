class BasicAuthController < ApiController
	include ActionController::HttpAuthentication::Basic::ControllerMethods
	def auth
		authenticate_or_request_with_http_basic do |username,password|
			resource = User.find_by_email(username)
			if resource.valid_password?(password)
				render status: :ok
			else
				render status: :unauthorized
			end
		end
	end
end
