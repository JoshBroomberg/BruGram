class CreateHashtagImageJoinTable < ActiveRecord::Migration
  def change
    create_join_table :hashtags, :images do |t|
       t.index [:hashtag_id, :image_id]
       t.index [:image_id, :hashtag_id]
    end
  end
end
