class Admin < User
  has_many :projects, :as => :owner
  has_many :requirement_specification, :as => :owner
end
