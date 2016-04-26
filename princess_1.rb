#!/bin/ruby

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

def go_up?(source, target)
    source[:top] > target[:top]
end
def go_down?(source, target)
    source[:top] < target[:top]
end
def go_right?(source, target)
    source[:left] < target[:left]
end
def go_left?(source, target)
    source[:left] > target[:left]
end
def reached_target?(source, target)
    source[:top] == target[:top] && source[:left] == target[:left]
end

def displayPathtoPrincess(n,grid)
    user = locate('m', grid)
    princess = locate('p', grid)
    reached = reached_target?(user, princess)
    while !reached
        if go_up?(user, princess)
            puts "UP"
            user[:top] -= 1
        elsif go_down?(user, princess)
            puts "DOWN"
            user[:top] += 1
        elsif go_right?(user, princess)
            puts "RIGHT"
            user[:left] += 1
        elsif go_left?(user, princess)
            puts "LEFT"
            user[:left] -= 1
        end
       reached = reached_target?(user, princess)
    end
end
m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip.split("")
end

displayPathtoPrincess(m,grid)
