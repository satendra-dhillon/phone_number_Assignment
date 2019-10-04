class PhoneNumbersController < ApplicationController
	def genrate_numbers
		(1111..1141).each do |number|
			PhoneNumber.create(no: number, assigned: false)
		end
		redirect_to phone_numbers_path
	end

	def assign_a_requested_number
		requested_number = PhoneNumber.available_numbers.find_by(no: params["no"].to_i)
		if requested_number.present?
			requested_number.update_attributes(assigned: true)
			redirect_to phone_number_path(requested_number)
		else
			redirect_to phone_numbers_path, flash[:error] = "Not Available"
		end 
	end

	def assign_a_number
		offset = rand(PhoneNumber.available_numbers.count)
		phone_number_to_assign = PhoneNumber.available_numbers.offset(offset).first
		if phone_number_to_assign.present?
			phone_number_to_assign.update_attributes(assigned: true)
			redirect_to phone_number_path(phone_number_to_assign)
		else
			redirect_to phone_numbers_path, flash[:error] = "Not Available"
		end 
	end

	def show
		@phone_number = PhoneNumber.find(params[:id])
	end
end
