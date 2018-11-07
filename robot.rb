#!/usr/bin/ruby
puts "\nToy Robot Loaded"

class Robot
  attr_reader :x_location, :y_location, :facing
  def initialize
    @x_location = -1
    @y_location = -1
    @facing = ""
  end

  def place(x_new, y_new, facing_new)
    @x_location = x_new
    @y_location = y_new
    @facing = facing_new
  end
end
