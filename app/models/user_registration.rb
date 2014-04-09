class UserRegistration
  include Virtus.model
  include ActiveModel::Model

  attr_reader :user
  attr_reader :user_profile
  attr :password_manager

  attribute :email, String
  attribute :password, String
  attribute :encrypted_password, String
  attribute :confirmation_token, String
  attribute :age, Integer
  attribute :country_code, String

  validates :email, presence: true
  validate :uniqueness_email
  validates :password, length: {:minimum => 6}
  validates :age, :country_code, presence: true
  validates :age, numericality: { only_integer: true }, unless: Proc.new { |a| a.age.blank? }

  def persisted?
    false
  end

  def save
    return unless valid?
    persist!
    send_confirmation_email
  end

  def persist!
    encrypt_password
    ensure_confirmation_token
    @user = User.create!(user_attributes)
    @user_profile = @user.create_user_profile!(profile_attributes)
  end

  def user_attributes
    {
      email: email,
      encrypted_password: encrypted_password,
      confirmation_token: confirmation_token
    }
  end

  def profile_attributes
    {
      age: age,
      country_code: country_code
    }
  end

  def uniqueness_email
    errors.add(:email, 'already been taken') if User.where(email: email).any?
  end

  def send_confirmation_email
    UserMailer.send_confirmation_email(self.user).deliver
  end

  def ensure_confirmation_token
    @confirmation_token = password_manager.generate_token
  end

  private

  def password_manager
    @password_manager ||= PasswordManager.new
  end

  def encrypt_password
    @encrypted_password = password_manager.encrypt_password(password)
  end
end
