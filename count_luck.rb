def locate(char, grid)
    top = left = nil
    grid.each_with_index do |row, r|
        row.each_with_index do |column, c|
           if column == char
               top = r
               left = c
           end
        end
    end
    {top: top, left: left}
end

def available_directions(player, grid, prev_move, move_signs = ["*", "."])
  directions = []
  directions << "up" if move_signs.include?(at_up(player, grid)) && prev_move != "up"
  directions << "right" if move_signs.include?(at_right(player, grid)) && prev_move != "right"
  directions << "down" if move_signs.include?(at_down(player, grid)) && prev_move != "down"
  directions << "left" if move_signs.include?(at_left(player, grid)) && prev_move != "left"
  directions
end

def right_direction(player, destination, directions, matrix)
  return directions.first if directions.size == 1
  possible = []
  puts directions.inspect
  directions.each do |direction|
    possible << {
      direction: direction,
      distance: distance_of(player, destination, direction, matrix)
    } if send("go_#{direction}?", player, destination)
  end
  puts possible.inspect
  return nil if possible.empty?
  possible.sort_by { |p| p[:distance] }.first[:direction]
end

def distance_of(source, target, direction, matrix)
  new_source = get_pos(source, direction)
  available_moves = available_directions(new_source, matrix, opposite_of(direction)).size
  available_moves -= 1 if available_moves == 0 # if no next movement available, it's a bad choice, so it's punished by -1
  ((new_source[:top].abs - target[:top].abs) + (new_source[:left].abs - target[:left].abs)).abs - available_moves
end

def go_up?(source, target)
    source[:top] >= target[:top]
end

def go_down?(source, target)
    source[:top] <= target[:top]
end

def go_right?(source, target)
    source[:left] <= target[:left]
end

def go_left?(source, target)
    source[:left] >= target[:left]
end

def reached_target?(source, target)
    source[:top] == target[:top] && source[:left] == target[:left]
end

def at_up(player, grid)
  return nil if (player[:top] - 1) < 0
  grid[player[:top] - 1][player[:left]]
end

def at_right(player, grid)
  return nil if (player[:left] + 1) > (grid[player[:top]].size - 1)
  grid[player[:top]][player[:left] + 1]
end

def at_down(player, grid)
  return nil if (player[:top] + 1) > (grid.size - 1)
  grid[player[:top] + 1][player[:left]]
end

def at_left(player, grid)
  return nil if (player[:left] - 1) < 0
  grid[player[:top]][player[:left] - 1]
end

def get_pos(player, direction)
  case direction
  when "up" then { top: player[:top] - 1, left: player[:left] }
  when "right" then { top: player[:top], left: player[:left] + 1 }
  when "down" then { top: player[:top] + 1, left: player[:left] }
  when "left" then { top: player[:top], left: player[:left] - 1 }
  end
end

def opposite_of(direction)
  case direction
  when "up" then "down"
  when "right" then "left"
  when "down" then "up"
  when "left" then "right"
  end
end

# Objective of the game is to make the "M" find the path to "*", with the rules:
# It should move through the matrix
# It can only move through "." characters
# The lucky guesses count should match the expected guesses (best moves over an intersection)

# inputs
n, m = 4, 11 # columns and rows

def matrixA
  matrix = []
  matrix << ".X.X......X".split('')
  matrix << ".X*.X.XXX.X".split('')
  matrix << ".XX.X.XM...".split('')
  matrix << "......XXXX.".split('')
  [matrix, 3]
end

def matrixB
  matrix = []
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << "M.......................................*".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  [matrix, 20]
end

def matrixC
  matrix = []
  matrix << "XXXXXXXXXXXXXXXXX".split('')
  matrix << "XXX.XX.XXXXXXXXXX".split('')
  matrix << "XX.*..M.XXXXXXXXX".split('')
  matrix << "XXX.XX.XXXXXXXXXX".split('')
  matrix << "XXXXXXXXXXXXXXXXX".split('')
  [matrix, 10]
end

def matrixD
  matrix = []
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << "M........................................".split('')
  matrix << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".*.......................................".split('')
  [matrix, 280]
end

def matrixE
  matrix = []
  matrix << ".X.XXXXXXXXXXXXXXXXXXX.X.X.X.X.X.X.X.X.X.".split('')
  matrix << "...XXXXXXXXXXXXXXXXXXX...................".split('')
  matrix << ".X..X.X.X.X.X.X.X..XXXX*X.X.X.X.X.X.X.XX.".split('')
  matrix << ".XXXX.X.X.X.X.X.X.XX.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XX.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XX.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XX.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".XX.X.X.X.XX.X.XX.X.X.X.X.X.X.X.X.X.X.X.X".split('')
  matrix << ".X.X.X.X.X.XXX.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << "X........................................".split('')
  matrix << "X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << ".X.XX.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.XX".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XMX.".split('')
  matrix << ".X....................................X..".split('')
  matrix << "..X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".X...................................X...".split('')
  matrix << ".XX.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.XX.XXXX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  matrix << "X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.XX.".split('')
  matrix << ".X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.X.".split('')
  matrix << ".........................................".split('')
  [matrix, 294]
end

matrix, expected_guesses = matrixD

# game
player = locate('M', matrix)
target = locate('*', matrix)
lucky_guesses = []
moves = 0
history = []
prev_move = nil

# gaming
while !reached_target?(player, target)
  directions = available_directions(player, matrix, prev_move)
  if directions.size >= 1
    # do move
    lucky_guesses << player if directions.size > 1 && !lucky_guesses.include?(player)
    go_to = right_direction(player, target, directions, matrix)
  else
    # restore last lucky move
    history.reverse.each do |hist|
      go_to = opposite_of(hist[0])
      if hist[1].size > 1
        hist[1].delete(hist[0])
        go_to = right_direction(player, target, hist[1], matrix)
        break
      end
      puts go_to
      player = get_pos(player, go_to)
    end
  end
  puts "player at #{player.inspect} go #{go_to} for #{target.inspect}"
  history << [go_to, directions]
  player = get_pos(player, go_to)
  moves += 1
  prev_move = opposite_of(go_to)
end

puts "Player reached target with #{moves} moves and #{lucky_guesses.size} lucky guesses"
puts "Expected guesses: #{expected_guesses}"
puts lucky_guesses.size == expected_guesses ? "Impressed" : "Oops!"
