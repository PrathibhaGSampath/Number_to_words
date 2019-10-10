class NumberCombination
  MIN_SIZE = 3

  def initialize(length)    
    @length = length
    # @min_size = 3
    @word_length = MIN_SIZE
  end

  # Will generate the split based on the length and min_size
  def get_number_combinations
    final_combination = Set.new

    while @word_length <= @length 
      combinations = []
      combinations.push(@word_length)
      remaining_length = @length - @word_length
      
      while remaining_length > 0 
        if remaining_length >= MIN_SIZE
          combinations.push(MIN_SIZE)
          remaining_length = remaining_length - MIN_SIZE
        else
          # If remianing legth is less than min_size add the reamining to the last.
          combinations[-1] = combinations[-1] + remaining_length
          remaining_length = 0
        end
      end

	  final_combination << combinations
	  max_rotation = combinations.length
		
	  # rotating the combinations to generate all possible combination
      # eg: [3, 3, 4], [3, 4, 3] & [4, 3, 3].
	  (1..max_rotation).upto { combination = combination.rotate
							   final_combination << combination
	  						 }
		
      @word_length = @word_length + 1
    end

    return final_combination.to_a 
  end
  
end