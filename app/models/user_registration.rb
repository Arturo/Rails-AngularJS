class UserRegistration
  include Virtus

  require 'digest/sha1'

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :user
  attr_reader :user_profile

  attribute :email, String
  attribute :password, String
  attribute :encrypted_password, String
  attribute :salt, String
  attribute :confirmation_token, String
  attribute :aasm_state, String
  attribute :age, Integer
  attribute :country_code, String

  validates :email, presence: true
  validates :password, length: {:minimum => 6}
  validates :age, :country_code, presence: true
  validates :age, numericality: { only_integer: true }

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      send_confirmation_email
      true
    else
      false
    end
  end

  private

    def persist!
      encrypt_password
      access_confirmation_token
      @user = User.create!(email: email, salt: salt, encrypted_password: encrypted_password,
                          confirmation_token: confirmation_token, aasm_state: 'pending')
      @user_profile = @user.create_user_profile!(age: age, country_code: country_code)
    end

    def send_confirmation_email
      UserMailer.send_confirmation_email(self.user).deliver
    end

    def access_confirmation_token
      self.confirmation_token = random_string(35)
    end

    def encrypt_password
      self.salt = Digest::SHA1.hexdigest("+--#{random_string(50) +
                  (Time.now + rand(10000)).to_s + random_string(50)}-+")
      self.encrypted_password = Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

    def random_string(len)
      rand_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" << "0123456789" << "abcdefghijklmnopqrstuvwxyz"

      rand_max = rand_chars.size
      srand
      ''.tap do |ret|
        len.times{ ret << rand_chars[rand(rand_max)] }
      end
    end

end
