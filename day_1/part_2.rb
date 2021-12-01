# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp).map(&:to_i)

WINDOW_SIZE = 3
increased = 0
(0...input.length-WINDOW_SIZE).each do |index|
  a = input[index...index+WINDOW_SIZE]
  b = input[index+1..index+WINDOW_SIZE]

  increased += 1 if(b.sum > a.sum)
end

puts increased