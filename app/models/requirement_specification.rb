class RequirementSpecification < ActiveRecord::Base
	attr_accessible :project_name, :name
	attr_accessor :project_name

	belongs_to :project
	belongs_to :owner, :polymorphic => true
	has_many :requirements

	validates :name, :presence => true

end
