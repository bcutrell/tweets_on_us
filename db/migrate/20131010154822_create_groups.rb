class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :tag, null: false

      t.timestamps
    end
  end
end
