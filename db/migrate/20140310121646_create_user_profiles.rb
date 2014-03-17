class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer   :user_id, null: false
      t.integer   :age, null: false
      t.string    :country_code, null: false, limit: 2
      t.timestamps
    end
  end
end
