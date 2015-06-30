class CreateFollowlinks < ActiveRecord::Migration
  def change
    create_table :followlinks do |t|
      t.integer :user_id
      t.integer :followee_id

      t.timestamps null: false
    end
  end
end
