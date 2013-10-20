class CreateRequirementSpecifications < ActiveRecord::Migration
  def change
    create_table :requirement_specifications do |t|
    	t.integer :owner_id
    	t.string :owner_type
    	t.integer :project_id
    	t.string :name

      t.timestamps
    end
  end
end
