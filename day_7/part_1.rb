# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
INPUT = File.open(file).readlines.map(&:chomp).first.split(',').map(&:to_i)

def median(array)
  return nil if array.empty?

  sorted = array.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end

target_postition = median(INPUT).to_i

puts INPUT.map{|value| (value - target_postition).abs}.sum
