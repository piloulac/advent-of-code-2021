# frozen_string_literal: true

file = File.join(File.dirname(__FILE__), 'input.txt')
input = File.open(file).readlines.map(&:chomp)

## parsing and extract input
data = []
curr = []
input.each do |row|
  if row.empty?
    data << curr
    curr = []
  else
    curr << row
  end
end

data << curr
draws = data.shift.first.split(",")

## prepare grid and bingo
grids_hash = [] 
data.map do |bingo_grid|
  new_hash = { location: {}, rowcount: Array.new(5, 0), columncount: Array.new(5, 0)}
  bingo_grid = bingo_grid.map{|row| row.scan(/\d+/)}
  (0...5).each do |i|
    (0...5).each do |j|
      val = bingo_grid[i][j]
      new_hash[val] = {i: i, j: j}
      new_hash[:location][val] = {i: i, j: j}
    end
  end
  grids_hash << new_hash
end

## process the draws
draws.each do |draw|
  grids_hash.each_with_index do |grid, index|
    if grid.key?(draw)
      location = grid[:location][draw]
      grid[:location].delete(draw)
      grid[:rowcount][location[:i]] += 1
      grid[:columncount][location[:j]] += 1

      if grid[:rowcount][location[:i]] == 5 || grid[:columncount][location[:j]] == 5
        sum_remaining =  grid[:location].keys.map(&:to_i).sum
        puts sum_remaining * draw.to_i
        return
      end
    end
  end
end