class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :profile, presence: true, length: { maximum: 30 }, on: :update
  validates :place, presence: true, length: { maximum: 30 }, on: :update
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
end
