class UserMailer < ActionMailer::Base
  default from: "from@example.com"


  def send_confirmation_email(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end

end
