class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 50, minimum: 2}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50, minimum: 4 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: true }
  
  validates :password, length: { minimum: 6 }

  has_many :words, dependent: :destroy
  has_many :choices, dependent: :destroy
end
