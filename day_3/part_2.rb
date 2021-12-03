# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp)

def search(data, index, &block)
  return data.first if data.length == 1

  hash = data.map{|row| row[index]}.tally
  keep = yield(hash)

  subset = data.select{|row| row[index] == keep}
  return search(subset, index + 1, &block)
end

oxygen = search(input, 0) do |hash|
  min_val, max_val = hash.values.minmax
  if min_val == max_val
    '1'
  else
    hash.key(max_val)
  end
end

co2 = search(input, 0) do |hash|
  min_val, max_val = hash.values.minmax
  if min_val == max_val
    '0'
  else
    hash.key(min_val)
  end
end

puts oxygen.to_i(2) * co2.to_i(2)