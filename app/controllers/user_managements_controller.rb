class UserManagementsController < ApplicationController

	def index
		@users = User.all
	end

	def create
		redirect_to :controller => "#{params[:user]}s", :action => "new"
	end

end