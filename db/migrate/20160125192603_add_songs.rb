class AddSongs < ActiveRecord::Migration
  def change

    create_table :songs do |t|
      t.references :user
      t.string :title
      t.string :author
      t.string :url
      t.integer :upvotes, default: 0, null: false
      t.string :comment
      t.datetime :created_at
      t.datetime :updated_at
    end

  end
end
