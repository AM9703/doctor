class User < ApplicationRecord
  has_secure_password
  has_many :messages
  enum role: {patient: 'paitent' , doctor: 'doctor'}
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, length: { minimum: 5 }
  validates :role, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  scope :all_except, ->(user) { where.not(id: user) } 
  after_create_commit { broadcast_append_to "users" }
end
