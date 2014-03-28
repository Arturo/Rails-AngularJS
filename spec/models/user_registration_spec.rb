require 'spec_helper'

describe UserRegistration do

  subject{ build(:user_registration) }
  specify { should be_valid }

  context 'is valid' do
    it 'with an email, password, age and country' do
      should be_valid
    end
  end

  it { should validate_presence_of :email }

  context 'is invalid' do
    subject{ build(:user_registration) }

    it 'without email' do
      subject.email = nil
      should have(1).errors_on(:email)
    end

    it 'without password' do
      subject.password = nil
      should have(1).errors_on(:password)
    end

    it 'without age' do
      expect(build(:user_registration, age: nil)).to have(1).errors_on(:age)
    end

    it 'without country code' do
      expect(build(:user_registration, country_code: nil)).to have(1).errors_on(:country_code)
    end

    it 'with a duplicate email address' do
      create(:user, email: 'test@example.com')
      expect(build(:user_registration, email: 'test@example.com')).to have(1).errors_on(:email)
    end
  end

end
