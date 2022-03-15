class User < ApplicationRecord
	# has_secure_password
	validates :email, :password, :role, presence: true
	enum role: {patient: 'paitent' , doctor: 'doctor'}
end
