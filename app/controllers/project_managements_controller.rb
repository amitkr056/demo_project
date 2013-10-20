class ProjectManagementsController < ApplicationController

	before_filter :require_user

	def index
		@projects = Project.find(:all, :conditions => {:owner_type => current_user.type, :owner_id => current_user.id}) 
	end

	def new
		@project = Project.new
	end

	def create
		@project = current_user.projects.new(params[:project])
		@project.owner_type = current_user.type
		if @project.save
			flash[:notice] = "Project created successfully."
			redirect_to :action => "index"
		else
			render :action => "new"
		end
	end
end
