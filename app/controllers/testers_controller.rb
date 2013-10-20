class TestersController < ApplicationController

	before_filter :require_user
	#before_filter :return_admin

	def new
		@tester = Tester.new
	end

	def create
		@tester = Tester.new(params[:tester])
		if @tester.save
			flash[:notice] = "Tester created successfully."
			redirect_to admin_user_managements_path(current_user.id)
		else
			render :action => "new"
		end
	end

	def dashboard
	end


end
