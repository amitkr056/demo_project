class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.integer :owner_id
    	t.string :owner_type
    	t.text :title
    	t.string :name
      t.timestamps
    end
  end
end
