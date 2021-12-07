# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
INPUT = File.open(file).readlines.map(&:chomp).first.split(',').map(&:to_i)

school = Array.new(9,0)

NUM_OF_DAYS = 80

INPUT.each do |i|
  school[i] += 1
end

NUM_OF_DAYS.times do
  lanternfish_to_create = school.shift
  school << lanternfish_to_create
  school[6] += lanternfish_to_create
end

puts school.sum