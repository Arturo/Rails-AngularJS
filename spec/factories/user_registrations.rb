require 'faker'

FactoryGirl.define do
  factory :user_registration do
    email { Faker::Internet.email }
    password "test123"
    age "22"
    country_code 'PL'

    factory :invalid_user_registration do
      age nil
      email nil
    end

  end
end
