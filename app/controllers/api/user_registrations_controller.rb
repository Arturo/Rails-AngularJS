class Api::UserRegistrationsController < Api::BaseController

	protected

	def permitted_params
		params.permit( user_registration: [:email, :password, :user_profile] )
	end
end