class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content, null: :false
      t.integer :tweeter_id, null: :false

      t.timestamps
    end
  end
end
