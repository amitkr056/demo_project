module ApplicationHelper

	def allowed_to_access_secondary_nav
		return true  if admin? || test_leader? || tester? || requirement_leader?
	end

	USERS = [
		["Test Leader", "test_leader"],
		["Tester", "tester"],
	["Requirement Leader", "requirement_leader"]]
	
	USTRRAILS_CONTROLLERS = %w(admins testers test_leaders requirement_leaders project_managements requirement_managements user_managements)

	def get_controller_name(controller)
      str = controller.scan(/[A-Z]/)
      unless str[1].nil?
        str = str[1].insert(0, '_')
        return controller.gsub!(str[1], str).downcase
      else
        return controller.downcase
      end
    end

end
