class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :password_confirmation
  
  acts_as_authentic do |c|
    c.login_field = 'user_name'
  end

end
