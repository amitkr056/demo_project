class RequirementLeadersController < ApplicationController

	before_filter :require_user
	#before_filter :return_admin

	def new
		@requirement_leader = RequirementLeader.new
	end

	def create
		@requirement_leader = RequirementLeader.new(params[:requirement_leader])
		if @requirement_leader.save
			flash[:notice] = "Requirement leader created successfully."
			redirect_to admin_user_managements_path(current_user.id)
		else
			render :action => "new"
		end
	end
end