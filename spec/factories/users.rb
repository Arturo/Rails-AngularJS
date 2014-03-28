require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password "c5c91436185f005ef6df194d559b5fdc5434794f"
    aasm_state "pending"
    confirmation_token "0byfHv0QeUMvJYISAG19D6LQ6DER1yKEc9b"

    after(:build) do |user|
      FactoryGirl.build(:user_profile)
    end

  end
end
