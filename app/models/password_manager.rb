#require 'bcrypt'

class PasswordManager
  include BCrypt

  def encrypt_password password
    BCrypt::Password.create(password)
  end

  def match_password(login_password = "")
    BCrypt::Password.new(password) == login_password
  end

  def generate_token
    secure_random
  end

  private

  def secure_random
    SecureRandom.base64
  end

end
