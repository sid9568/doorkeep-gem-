class ApplicationController < ActionController::Base
	
    skip_before_action :verify_authenticity_token
   # before_action :doorkeeper_authorize!
   before_action :check_logged_user

	

end
