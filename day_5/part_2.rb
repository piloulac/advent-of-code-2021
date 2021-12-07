# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp)


hash = {}
input.each do |row |
  match = row.match(/(\d+),(\d+)\s->\s(\d+),(\d+)/)
  x1,y1,x2,y2 = [match[1],match[2],match[3],match[4]].map(&:to_i)

  width_and_height = [x2 - x1, y2 - y1]
  dx, dy = width_and_height.map { |x| x <=> 0 }

  (width_and_height.map(&:abs).max + 1).times do |i|
    hash[[x1 + i * dx, y1 + i * dy]] ||= 0
    hash[[x1 + i * dx, y1 + i * dy]] += 1
  end

end

puts hash.values.count{|val| val > 1}
