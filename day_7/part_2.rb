# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
INPUT = File.open(file).readlines.map(&:chomp).first.split(',').map(&:to_i)

min,max = INPUT.minmax

answer = (min..max).map do |target_postition|
  INPUT.map do |value| 
    dist = (target_postition - value).abs
     (dist * (dist + 1)) / 2
  end.sum
end.min

puts answer