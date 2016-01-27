class AddUser < ActiveRecord::Migration
  def change

     create_table :users do |t|
      t.string :email
      t.string :user_name
      t.string :password
      t.string :password_confirmation
      t.datetime :created_at
      t.datetime :updated_at
    end

  end
end
