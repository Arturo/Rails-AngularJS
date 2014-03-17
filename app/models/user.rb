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

end
