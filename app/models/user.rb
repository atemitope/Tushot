class User < ActiveRecord::Base
  has_secure_password
  has_many :links

  validates :username,
            presence: true,
            length: { in: 4..40 }

  validates :email,
            presence: true,
            length: { maximum: 255 },
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 8 }
  validates :password_confirmation, length: { minimum: 8 }
end
