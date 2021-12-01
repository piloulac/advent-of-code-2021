# frozen_string_literal: true

require 'set'

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp).map(&:to_i)

increased = 0

prev = input.shift
input.each do |val|
  if val > prev
    increased+=1
  end
  prev = val
end

puts increased