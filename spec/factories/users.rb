require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password "c5c91436185f005ef6df194d559b5fdc5434794f"
    salt "3d75d497e4f14ef90be8eb039b077f454281d306"
    aasm_state "pending"
    confirmation_token "0byfHv0QeUMvJYISAG19D6LQ6DER1yKEc9b"

    after(:build) do |user|
      FactoryGirl.build(:user_profile)
    end

  end
end
