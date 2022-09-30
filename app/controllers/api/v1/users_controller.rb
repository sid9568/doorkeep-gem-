class Api::V1::UsersController < ApplicationController
	 

	def signup
	    @user = User.find_by_email(params[:email]) if params[:email].present?
	    
	    if	@user = User.create!(email: params[:email],password: params[:password])
	    	render :json => {code:200, message: "thank you for signup"}
			
	    else
	    	render :json => {code:404, message: "plese try agin"}
	    end
	end

def check_logged_user
    unless current_user
      #build_response_view("unauthorized", nil, {})
      render :json => {code: 400, message: "unauthorized"}
    end
  end


	 def current_user
    @user = User.find_by_id(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end




	def update_password
		p @user
		p "================================================================================"
		 if @user && @user.authenticate(params[:password])
			@user.update!(password:params[:new_password])
		    render :json => {code: 200, message: "Password update successfully"}
		else
	    render :json => {code: 400, message: "Old password does not matched"}
		 end

	end 
	
	

	

end
