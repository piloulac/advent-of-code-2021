# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp).map{|row| row.split}

final_depth = 0
final_horizontal = 0

input.each do |instruction, value|
  value = value.to_i
  if instruction == 'forward'
    final_horizontal += value
  elsif instruction == 'down'
    final_depth += value
  elsif instruction == 'up'
    final_depth -= value
  else
  end
end

puts [final_depth, final_horizontal]
puts final_depth * final_horizontal