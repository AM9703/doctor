class Paitent < ApplicationRecord
	enum gender: [:male, :female, :other]
end
