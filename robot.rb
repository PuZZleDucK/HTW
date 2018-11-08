#!/usr/bin/ruby
puts "\nToy Robot Loaded"

class Robot
  attr_reader :x_location, :y_location, :facing
  @@directions = ["NORTH", "EAST", "SOUTH", "WEST"]
  def initialize
    @x_location = -1
    @y_location = -1
    @facing = ""
  end

  def place(x_new, y_new, facing_new)
    return unless x_new >= 0 && x_new < 5 && y_new >= 0 && y_new < 5 && @@directions.include?(facing_new)
    @x_location = x_new
    @y_location = y_new
    @facing = facing_new
  end

  def left
    @facing = @@directions[(@@directions.find_index(@facing) - 1) % 4]
  end

  def right
    @facing = @@directions[(@@directions.find_index(@facing) + 1) % 4]
  end
end
