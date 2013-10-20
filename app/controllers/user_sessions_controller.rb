class UserSessionsController < ApplicationController

	before_filter :require_no_user, :only => [:new, :create]
	before_filter :require_user, :only => [:index, :destroy]
  
	def new
 		@user_session = UserSession.new
	end
  
	def create
 		@user_session = UserSession.new(params[:user_session])
 		if @user_session.save
  			flash[:notice] = "Login successful!"
  			redirect_to user_sessions_path
 		else
  			render :action => :new
 		end
	end
  
	def destroy
 		current_user_session.destroy
 		flash[:notice] = "Logout successfully!"
 		redirect_back_or_default new_user_session_url
	end

	def index
		controller = get_controller_name(@current_user.type)
		redirect_to :controller => "#{controller}s", :action => "dashboard", :id => "#{@current_user.id}"
	end


end