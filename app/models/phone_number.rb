class PhoneNumber < ApplicationRecord

	scope :available_numbers, -> { where(assigned: false) }
end
