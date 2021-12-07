# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp)


hash = {}
input.each do |row |
  match = row.match(/(\d+),(\d+)\s->\s(\d+),(\d+)/)
  x1,y1,x2,y2 = [match[1],match[2],match[3],match[4]].map(&:to_i)

  if x1 == x2
    min, max = [y1,y2].minmax
    (min..max).each do |val|
      hash[[x1, val]] ||= 0
      hash[[x1, val]] += 1
    end
  end
  
  if y1 == y2
    min, max = [x1,x2].minmax
    (min..max).each do |val|
      hash[[val, y1]] ||= 0
      hash[[val, y1]] += 1
    end
  end
end

puts hash.values.count{|val| val > 1}
