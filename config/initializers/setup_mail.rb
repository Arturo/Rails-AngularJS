ActionMailer::Base.smtp_settings = {
  :address => "",
  :port => 25,
  :domain => "localhost:3000",
  :user_name => "tech@example.com",
  :password => "",
  :authentication => :login,
  :enable_starttls_auto => false
}
