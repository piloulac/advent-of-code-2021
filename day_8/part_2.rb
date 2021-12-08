# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
INPUT = File.open(file).readlines.map(&:chomp)

# group number of segments per digit
NUM_SEGMENTS_TO_DIGIT = {
  2 => [1],
  3 => [7],
  4 => [4],
  5 => [2, 3, 5],
  6 => [0, 6, 9],
  7 => [8]
}

# list required segments for a digit:
# following this graph
#    1111
#   2    3
#   2    3
#    4444
#   5    6
#   5    6
#    7777
SEGMENTS_FOR_DIGIT = {
  0 => [1,2,3,5,6,7],
  1 => [3,6],
  2 => [1,3,4,5,7],
  3 => [1,3,4,6,7],
  4 => [2,3,4,6],
  5 => [1,2,4,6,7],
  6 => [1,2,4,5,6,7],
  7 => [1,3,6],
  8 => [1,2,3,4,5,6,7],
  9 => [1,2,3,4,6,7]
}

# common segments between two digits
INTERSECTION = {
  0 => {
    1 => 2,
    4 => 3,
    7 => 3,
  },
  6 => {
    1 => 1,
    4 => 3,
    7 => 2,
  },
  9 => {
    1 => 2,
    4 => 4,
    7 => 3,
  },
  2 => {
    1 => 1,
    4 => 2,
    7 => 2,
  },
  3 => {
    1 => 2,
    4 => 3,
    7 => 3,
  },
  5 => {
    1 => 1,
    4 => 3,
    7 => 2,
  },
}

total = INPUT.map do |row|
  possible_mapping = {
    'a' => [1,2,3,4,5,6,7],
    'b' => [1,2,3,4,5,6,7],
    'c' => [1,2,3,4,5,6,7],
    'd' => [1,2,3,4,5,6,7],
    'e' => [1,2,3,4,5,6,7],
    'f' => [1,2,3,4,5,6,7],
    'g' => [1,2,3,4,5,6,7]
  }
  match = {}
  signal_patterns, output = row.split(' | ')
  uniq_combinations, non_uniq_combinations = signal_patterns.split.partition do |pattern|
    NUM_SEGMENTS_TO_DIGIT[pattern.length].length == 1
  end

  uniq_combinations.each do |pattern|
    number = NUM_SEGMENTS_TO_DIGIT[pattern.length].first
    match[number] = pattern
      coding_segments = SEGMENTS_FOR_DIGIT[number]
      pattern.split('').each do |letter|
    end
  end

  non_uniq_combinations.each do |pattern|
    coding_numbers = NUM_SEGMENTS_TO_DIGIT[pattern.length]
    coding_numbers.each do |number|
      possibible_digit = INTERSECTION[number]
      is_correct_digit = possibible_digit.all? do |key, value|
        inter = (match[key].split('') & pattern.split(''))
        inter.length == value
      end

      match[number] = pattern if is_correct_digit
    end

  end

  match.each do |number, pattern|
    coding_segments = SEGMENTS_FOR_DIGIT[number]
    pattern.split('').each do |letter|
      possible_mapping[letter] &= coding_segments
      
      # we found the shuffle, removing it from the array!
      if possible_mapping[letter].length == 1
        possible_mapping.each do |key, value|
          next if key == letter
          possible_mapping[key] -= possible_mapping[letter]
        end
      end
    end
  end

  possible_mapping.transform_values!(&:first)

  output.split.map do |pattern|
    segments = pattern.split('').map{|char| possible_mapping[char]}
    SEGMENTS_FOR_DIGIT.find do |key, value|
      pattern.length == value.length &&
        (value & segments).length == segments.length 
    end[0]
  end.join.to_i
end

puts total.sum