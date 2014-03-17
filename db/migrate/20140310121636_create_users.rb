class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, uniq: true
      t.string :encrypted_password, null: false
      t.string :salt, null: false
      t.string :aasm_state
      t.string :confirmation_token
      t.timestamps
    end

    add_index :users, :email
  end
end
