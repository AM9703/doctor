class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, length: { minimum: 5 }
  validates :role, presence: true
  enum role: {patient: 'paitent' , doctor: 'doctor'}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
