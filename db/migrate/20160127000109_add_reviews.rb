class AddReviews < ActiveRecord::Migration
  def change
      create_table :reviews do |t|
      t.integer :user_id
      t.integer :song_id
      t.string :userreview
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
