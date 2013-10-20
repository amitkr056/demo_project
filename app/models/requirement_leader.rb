class RequirementLeader < User
  has_many :requirement_specification, :as => :owner
end
