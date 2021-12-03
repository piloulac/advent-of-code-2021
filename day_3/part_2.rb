# frozen_string_literal: true


file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp)
INPUT_LENGTH = input[0].length

gamma = ''
epsilon = ''

def search_oxygen(data, index)
  return data.first if data.length == 1

  hash = data.map{|row| row[index]}.tally

  min_val, max_val = hash.values.minmax
  keep = if min_val == max_val
    '1'
  else
    hash.key(max_val)
  end

  subset = data.select{|row| row[index] == keep}
  return search_oxygen(subset, index + 1)
end

def search_co2(data, index)
  return data.first if data.length == 1

  hash = data.map{|row| row[index]}.tally

  min_val, max_val = hash.values.minmax
  keep = if min_val == max_val
    '0'
  else
    hash.key(min_val)
  end

  subset = data.select{|row| row[index] == keep}
  return search_co2(subset, index + 1)
end


oxygen = search_oxygen(input, 0)
co2 = search_co2(input, 0)
puts oxygen.to_i(2) * co2.to_i(2)