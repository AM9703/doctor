class User < ApplicationRecord
	has_secure_password
	validates :email, :password, :password_confirmation, :role, presence: true, on: :create,
	length: { minimum: 5 }, on: :create
    enum role: {patient: 'paitent' , doctor: 'doctor'}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
