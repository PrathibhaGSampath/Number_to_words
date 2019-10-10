require 'set'

$number_to_letter_hash = {
						 2 => ["a","b", "c"], 
						 3 => ["d","e", "f"], 
						 4 => ["g","h", "i"],
						 5 => ["j","k", "l"], 
						 6 => ["m","n", "o"], 
						 7 => ["p","q", "r", "s"], 
						 8 => ["t","u", "v"], 
						 9 => ["w","x", "y", "z"]
						}
class User

	splited_numbers = []
	@letters_combination = []

	def initialize
	end

	attr_accessor :phone_number

	def get_phone_number_word_combination
		dictionary_word = []
		splited_numbers = phone_number.split("-").map {|string_arr| string_arr unless (string_arr.include?("0") || string_arr.include?("1"))  }.compact

		unless splited_numbers.empty? || splited_numbers == nil
			splited_numbers.each do |number|
				@letters_combination = number.chars.map { |key| $number_to_letter_hash["#{key}".to_i] }
			end
		else
			return  "Not possible to convert this phone number"
		end

		return  "Phone Number should contain 10 Digits" if @letters_combination.size != 10

		if @letters_combination.empty?
			return  "Not possible to convert this phone number"
		else
			get_all_the_possible_dictionary_words
		end
	end

private
	def get_all_the_possible_dictionary_words
		result = []
		puts result << possible_three_letter_combinations.flatten
		puts result << possible_four_letter_combinations.flatten
		puts result << possible_five_letter_combinations.flatten
		puts result << possible_six_letter_combinations.flatten
		puts result << possible_seven_letter_combinations.flatten
		puts result << combine_array(0,9).flatten
		return result
	end


	def possible_three_letter_combinations
		combination_first, combination_second, combination_third = nil, nil, nil
		result = combine_array(0,2)
		unless result.empty?
			first_combination, second_combination, third_combination = [], [], []

			first_combination << result
			first_combination << combine_array(3,5)
			unless first_combination[1].empty? 
				first_combination << combine_array(6,9)
				unless first_combination[2].empty? 
					combination_first = first_combination[0].product(first_combination[1]).product(first_combination[2]).map { | item| item.flatten.join(",") }
				end
			end	
			second_combination << result
			second_combination << combine_array(3,6)
			unless second_combination[1].empty? 
				second_combination << combine_array(7,9)
				unless second_combination[2].empty? 
					combination_second = second_combination[0].product(second_combination[1]).product(second_combination[2]).map { | item| item.flatten.join(",") }
				end
			end
			third_combination << result
			third_combination << combine_array(3,9)
			unless third_combination[1].empty?
				combination_third = third_combination[0].product(third_combination[1]).map { | item| item.flatten.join(",")}
			end
		end
		return [combination_first, combination_second, combination_third].compact
	end

	def possible_four_letter_combinations
		combination_first, combination_second = nil, nil
		result = combine_array(0,3)
		unless result.empty?
			first_combination, second_combination, third_combination = [], [], []

			first_combination << result
			first_combination << combine_array(4,6)
			unless first_combination[1].empty? 
				first_combination << combine_array(7,9)
				unless first_combination[2].empty? 
					combination_first = first_combination[0].product(first_combination[1]).product(first_combination[2]).map { | item| item.flatten.join(",") }
				end
			end	
			second_combination << result
			second_combination << combine_array(4,9)
			unless second_combination[1].empty?  
				combination_second = second_combination[0].product(second_combination[1]).map { | item| item.flatten.join(",") }
			end
		end
		return [combination_first, combination_second].compact
	end

	def possible_five_letter_combinations
		combination = nil
		result = combine_array(0,4)
		unless result.empty?
			first_combination, second_combination, third_combination = [], [], []

			first_combination << result
			first_combination << combine_array(5,9)
			unless first_combination[1].empty? 
				combination = first_combination[0].product(first_combination[1]).map { | item| item.flatten.join(",") }
			end	
		end
		return [combination].compact
	end

	def possible_six_letter_combinations
		combination = nil
		result = combine_array(0,5)
		unless result.empty?
			first_combination, second_combination, third_combination = [], [], []

			first_combination << result
			first_combination << combine_array(6,9)
			unless first_combination[1].empty? 
				combination = first_combination[0].product(first_combination[1]).map { | item| item.flatten.join(",") }
			end	
		end
		return [combination].compact
	end

	def possible_seven_letter_combinations
		combination = nil
		result = combine_array(0,6)
		unless result.empty?
			first_combination, second_combination, third_combination = [], [], []

			first_combination << result
			first_combination << combine_array(7,9)
			unless first_combination[1].empty? 
				combination = first_combination[0].product(first_combination[1]).map { | item| item.flatten.join(",") }
			end	
		end
		return [combination].compact
	end
	
	def combine_array(start_index, end_index)
		word_combination = []
		dictionary_words = []
		header_lines = 1
		batch_size   = 1024
		word_combination = matrix_product(start_index, end_index)
		word_combination =  word_combination.group_by {|word| word[0].upcase }
		File.open("dictionary.txt") do |file|
			file.lazy.drop(header_lines).each_slice(batch_size) do |lines|
				lines = lines.group_by {|word| word[0].upcase }
				lines.each do |key, value|
					alphabet_words = word_combination["#{key}"]
					if alphabet_words != nil && !alphabet_words.empty?
						value = value.to_set
						alphabet_words.each do |word|
							search_word = word.upcase + "\n"
							if value.include?(search_word)
								dictionary_words << word
								word_combination["#{key}"].delete(word)
							end
						end
					end
				end
			end
			dictionary_words
		end
	end

	def matrix_product(min_range,max_range)
		initial_array = @letters_combination[min_range]
		(min_range + 1).upto(max_range) do |i|
			initial_array = initial_array.product(@letters_combination[i])
		end
		initial_array = initial_array.map { | item| item.flatten.join(",").delete(",") }
		return initial_array
	end
end