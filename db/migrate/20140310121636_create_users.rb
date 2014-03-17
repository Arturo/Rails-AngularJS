class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :salt, null: false
      t.timestamps
    end

    add_index :users, :email
  end
end
