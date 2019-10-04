number_to_letter_hash = {
						 2 => ["a","b", "c"], 
						 3 => ["d","e", "f"], 
						 4 => ["g","h", "i"],
						 5 => ["j","k", "l"], 
						 6 => ["m","n", "o"], 
						 7 => ["p","q", "r", "s"], 
						 8 => ["t","u", "v"], 
						 9 => ["w","x", "y", "z"]
						}
class PhoneNumber

	@phone_number = nil
	splited_numbers = []

	attr_accessor :phone_numbre

	def set(number)
		begin
			@phone_number = number
		rescue
		end
	end

	def get_word_combination
		letters_combination = []
		splited_numbers = @phone_number.split("-").map {|string_arr| string_arr unless (string_arr.include?("0") || string_arr.include?("1"))  }.compact

		unless splited_numbers.blank?
			splited_numbers.each do |number|
				letters_combination = number.chars.map { |key| number_to_letter_hash["#{key}".to_i] }
			end
		end

		number_length = letters_combination.count
		for index in 0...(number_length - 1) 
			p letters_combination[index].product()
		end
	end

["m", "n", "o"].product(["m", "n", "o"]).map { | item| item.flatten.join(",").delete(",") }.product(["t", "u", "v"])


end