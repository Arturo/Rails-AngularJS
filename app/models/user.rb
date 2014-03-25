class User < ActiveRecord::Base
  include AASM

  has_one :user_profile

  aasm do
    state :pending, initial: true
    state :active
    event :confirmed do
      transitions :from => :pending, :to => :active
    end
  end

  def confirm!
    confirmed
  end

  def self.find_by_token_and_padding_state confirmation_token
    where(confirmation_token: confirmation_token, aasm_state: 'padding').first
  end

end
