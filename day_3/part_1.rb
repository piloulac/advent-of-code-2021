# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp)


input_length = input[0].length

gamma = ''
epsilon = ''

(0...input_length).each do |index|
  hash = input.map{|row| row[index]}.tally
  min_val, max_val = hash.values.minmax
  max = hash.key(max_val)
  min = hash.key(min_val)
  gamma += max
  epsilon += min
end

puts gamma.to_i(2) * epsilon.to_i(2)
