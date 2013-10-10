class CreateTweeterGroups < ActiveRecord::Migration
  def change
    create_table :tweeter_groups do |t|
      t.integer :tweeter_id
      t.integer :group_id

      t.timestamps
    end
  end
end
