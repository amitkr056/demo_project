module ProjectManagementsHelper

	def get_path_to_create_project(current_user)
		return (current_user.type == "Admin" ? admin_project_managements_path(current_user.id) : test_leader_project_managements_path(current_user.id))
	end
end
