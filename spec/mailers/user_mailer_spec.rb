require 'spec_helper'

describe UserMailer do
  describe 'send_confirmation_email' do
    let(:user){ build_stubbed(:user) }
    let(:mail) { UserMailer.send_confirmation_email(user) }

    it 'renders the subject' do
      mail.subject.should eq 'Instructions'
    end

    it 'renders the receiver email' do
      mail.to.should eq [user.email]
    end

    it 'renders the sender email' do
      mail.from.should eq ['from@example.com']
    end

    it 'assigns @confirmation_url' do
      mail.body.encoded.should match("http://localhost:3000/user/confirm/#{user.confirmation_token}")
    end
  end
end
