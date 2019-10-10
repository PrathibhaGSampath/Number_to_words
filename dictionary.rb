require 'set'
class Dictionary

	def initialize
		@dictionary_words = Hash.new.tap {|hash| ("A".."Z").each{|alphabet| hash[alphabet] = Set.new}}
		group_dictionary_words
	end

	private 
	def group_dictionary_words
		file = File.open("dictionary.txt")
		file_data = file.readlines.map(&:chomp)
		file.close
		file_data.group_by {|word| word[0].upcase }.map {|k, v| @dictionary_words[k] = v.to_set }
	end
end