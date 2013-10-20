class ApplicationController < ActionController::Base

    helper :all
  	helper_method :current_user_session, :current_user, :admin?, :test_leader?, :tester?, :requirement_leader?
  	protect_from_forgery

  	def admin?
  		current_user.type == "Admin" if current_user
  	end

  	def test_leader?
      current_user.type == "TestLeader" if current_user
  	end

  	def tester?
      current_user.type == "Tester" if current_user
  	end

  	def requirement_leader?
      current_user.type == "RequirementLeader" if current_user
  	end

    def get_controller_name(controller)
      str = controller.scan(/[A-Z]/)
      unless str[1].nil?
        str = str[1].insert(0, '_')
        return controller.gsub!(str[1], str).downcase
      else
        return controller.downcase
      end
    end

  	protected

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page."
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page."
        controller = get_controller_name(current_user.type)
        redirect_to :controller => "#{controller}s", :action => "dashboard", :id => current_user.id
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.original_url
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def return_admin
      unless current_user.type == "Admin"
        flash[:notice] = "Bad Request..."
        return false
      end
    end

end
