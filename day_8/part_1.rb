# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
INPUT = File.open(file).readlines.map(&:chomp)

hash_number_segments = {
  2 => [1],
  3 => [7],
  4 => [4],
  5 => [2, 3, 5],
  6 => [0, 6, 9],
  7 => [8]
}

total_uniq = 0
INPUT.each do |row|
  signal_patterns, output = row.split(' | ')
  
  t = output.split().map do |digit| 
    if hash_number_segments[digit.length].length == 1
      1
    else
      0
    end
  end

  total_uniq += t.sum
end

puts total_uniq