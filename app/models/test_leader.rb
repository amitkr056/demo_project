class TestLeader < User
  has_many :projects, :as => :owner
end
