class TestLeadersController < ApplicationController

	before_filter :require_user
	#before_filter :return_admin

	def new
		@test_leader = TestLeader.new
	end

	def create
		@test_leader = TestLeader.new(params[:test_leader])
		if @test_leader.save
			flash[:notice] = "Test leader created successfully."
			redirect_to admin_user_managements_path(current_user.id)
		else
			render :action => "new"
		end
	end

	def dashboard
	end
end
