require 'benchmark'
require_relative 'user.rb'

user = User.new
user.phone_number = "1-800-6686787825"

puts "Overall Excecution time"
puts time = Benchmark.measure {
	user.get_phone_number_word_combination
}

def get_all_the_possible_dictionary_words(user)
puts "Time taken get all the combination that start with 3 Letter word"
puts time = Benchmark.measure {
user.send :possible_three_letter_combinations
}
puts "Time taken get all the combination that start with 4 Letter word"
puts time = Benchmark.measure {
user.send :possible_four_letter_combinations
}
puts "Time taken get all the combination that start with 5 Letter word"
puts time = Benchmark.measure {
user.send :possible_five_letter_combinations
}

puts "Time taken get all the combination that start with 6 Letter word"
puts time = Benchmark.measure {
user.send :possible_six_letter_combinations
}

puts "Time taken get all the combination that start with 7 Letter word"
puts time = Benchmark.measure {
user.send :possible_seven_letter_combinations
}

puts "Time taken get all the combination that start with 10 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 0,9
} 
end

puts "Time taken by different words combination size"
get_all_the_possible_dictionary_words(user)

puts "Time taken by inividual combination size"

puts "Time taken for the letter combination that start with 3 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 0,2
} 

puts "Time taken for the letter combination that start with 3 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 3,5
}

puts "Time taken for the letter combination that start with 3 Letter word" 
puts time = Benchmark.measure {
user.send :combine_array, 6,9
} 

puts "Time taken for the letter combination that start with 4 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 3,6
} 
puts "Time taken for the letter combination that start with 3 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 7,9
} 
puts "Time taken for the letter combination that start with 4 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 0,3
} 
puts "Time taken for the letter combination that start with 3 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 4,6
} 
puts "Time taken for the letter combination that start with 3 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 7,9
} 

puts "Time taken for the letter combination that start with 6 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 4,9
}
puts "Time taken for the letter combination that start with 5 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 0,4
}
puts "Time taken for the letter combination that start with 5 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 5,9
}
puts "Time taken for the letter combination that start with 6 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 0,5
}
puts "Time taken for the letter combination that start with 4 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 6,9
}
puts "Time taken for the letter combination that start with 7 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 0,6
}
puts "Time taken for the letter combination that start with 3 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 7,9
}
puts "Time taken for the letter combination that start with 10 Letter word"
puts time = Benchmark.measure {
user.send :combine_array, 0,9
}
