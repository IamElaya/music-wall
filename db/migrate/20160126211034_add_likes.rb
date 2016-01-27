class AddLikes < ActiveRecord::Migration
  def change
      create_table :likes do |t|
      t.integer :user_id
      t.integer :song_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
