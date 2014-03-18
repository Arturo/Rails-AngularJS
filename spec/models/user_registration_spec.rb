require 'spec_helper'

describe UserRegistration do

  it 'is valid with a email, password, age and country' do
    expect(build(:user_registration)).to be_valid
  end

  it { should validate_presence_of :email }

 # it 'is invalid without email' do
 #   expect(build(:user_registration, email: nil)).to have(1).errors_on(:email)
 # end

  it 'is invalid without password' do
    expect(build(:user_registration, password: nil)).to have(1).errors_on(:password)
  end

  it 'is invalid without age' do
    expect(build(:user_registration, age: nil)).to have(1).errors_on(:age)
  end

  it 'is invalid without country code' do
    expect(build(:user_registration, country_code: nil)).to have(1).errors_on(:country_code)
  end

  it 'is invalid with a duplicate email address' do
    create(:user, email: 'test@example.com')
    expect(build(:user_registration, email: 'test@example.com')).to have(1).errors_on(:email)
  end

  describe '#send_confirmation_email' do
    it 'send an email' do
      build(:user_registration).send(:send_confirmation_email)
      ActionMailer::Base.deliveries.last.to.should == [user_registration.email]
    end
  end

end
