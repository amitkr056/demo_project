class AdminsController < ApplicationController

	before_filter :require_user, :only => [:dashboard, :user_managment ]

	def dashboard
	end

	def user_managment
	end
end
