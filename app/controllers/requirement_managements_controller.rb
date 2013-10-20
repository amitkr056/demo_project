class RequirementManagementsController < ApplicationController
	before_filter :require_user

	def index
		@projects = Project.find(:all, :include => :requirement_specifications)
	end

	def new
		@projects = Project.all
		@requirement_specification = RequirementSpecification.new
	end

	def create
		@requirement_specification = RequirementSpecification.new(params[:requirement_specification])
		@requirement_specification.project_id = params[:requirement_specification][:project_name]
		@requirement_specification.owner_id = current_user.id
		@requirement_specification.owner_type = current_user.type
		if @requirement_specification.save
			flash[:notice] = "Requirement Specification created successfully."
			redirect_to :action => "index"
		else
			render :action => :new
		end
	end

	def edit
		@requirement_specification = RequirementSpecification.find_by_id(params[:id])
	end

	def update
		@requirement_specification = RequirementSpecification.find_by_id(params[:id])
		if @requirement_specification.update_attributes(params[:requirement_specification])
			flash[:notice] = "Requirement Specification updated successfully."
			redirect_to :action => "index"
		else
			render :action => :edit
		end
	end

	def destroy
		@requirement_specification = RequirementSpecification.find_by_id(params[:id])
		@requirement_specification.destroy
		flash[:notice] = "Requirement Specification destroyed successfully."
		redirect_to :action => "index"
	end
end
