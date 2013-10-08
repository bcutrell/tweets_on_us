class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
      t.string :handle, null: false

      t.timestamps
    end
  end
end
