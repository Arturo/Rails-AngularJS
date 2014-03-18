class UserMailer < ActionMailer::Base
  default from: "from@example.com"


  def send_confirmation_email(user)
    @user = user
    @confirmation_url = confirmation_url(confirmation_token: user.confirmation_token)
    mail to: user.email, subject: 'Instructions'
  end

end
