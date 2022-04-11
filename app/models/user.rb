class User < ApplicationRecord
  after_create_commit { broadcast_append_to "users" }
  has_secure_password
  has_many :messages
  enum role: {patient: 'paitent' , doctor: 'doctor'}
  validates :email, :password, :password_confirmation, :role, presence: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  scope :all_except, ->(user) { where.not(id: user) } 
end
