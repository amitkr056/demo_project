class Project < ActiveRecord::Base
	attr_accessible :title, :name, :description

	belongs_to :owner, :polymorphic => true

	has_many :requirement_specifications
	validates :title, :presence => true
  	validates :name, :presence => true
  	validates :description, :presence => true

end
