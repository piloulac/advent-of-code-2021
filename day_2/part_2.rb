# frozen_string_literal: true


file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp).map{|row| row.split}

aim =  0
final_depth = 0
final_horizontal = 0

input.each do |instruction, value|
  value = value.to_i
  if instruction == 'forward'
    final_horizontal += value
    final_depth += aim * value
  elsif instruction == 'down'
    aim += value
  elsif instruction == 'up'
    aim -= value
  else
  end
end

puts [final_depth, final_horizontal]
puts final_depth * final_horizontal