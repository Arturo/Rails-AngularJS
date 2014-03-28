class User < ActiveRecord::Base
  include AASM

  has_one :user_profile
  scope :pending, -> { where(aasm_state: 'pending') }

  aasm do
    state :pending, initial: true
    state :active
    event :confirm do
      transitions :from => :pending, :to => :active
    end
  end

end
