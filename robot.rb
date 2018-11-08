#!/usr/bin/ruby

class Robot
  attr_reader :x_location, :y_location, :facing
  @@directions = ["NORTH", "EAST", "SOUTH", "WEST"]
  def initialize
    @x_location = -1
    @y_location = -1
    @facing = ""
  end

  def report
    return if @x_location == -1 && @y_location == -1 && @facing == ""
    return "#{@x_location},#{@y_location},#{@facing}"
  end

  def move
    @x_location = @x_location += 1 if @facing == "NORTH" && @x_location < 4
    @y_location = @y_location += 1 if @facing == "EAST" && @y_location < 4
    @x_location = @x_location -= 1 if @facing == "SOUTH" && @x_location > 0
    @y_location = @y_location -= 1 if @facing == "WEST" && @y_location > 0
  end

  def place(x_new, y_new, facing_new)
    return unless x_new >= 0 && x_new < 5 && y_new >= 0 && y_new < 5 && @@directions.include?(facing_new)
    @x_location = x_new
    @y_location = y_new
    @facing = facing_new
  end

  def left
    return unless @x_location >= 0 && @y_location >= 0 && @@directions.include?(@facing)
    @facing = @@directions[(@@directions.find_index(@facing) - 1) % 4]
  end

  def right
    return unless @x_location >= 0 && @y_location >= 0 && @@directions.include?(@facing)
    @facing = @@directions[(@@directions.find_index(@facing) + 1) % 4]
  end
end


puts "HTW Toy Robot\n  Usage: ./robot <path/to/input/file>" if ARGV.size == 0

robot = Robot.new()
commands = (File::read ARGV[0]).split("\n").each do |input_line|
  command, rest = input_line.split(" ")
  case command
  when "PLACE"
    command_args = rest.split(",")
    robot.place(command_args[0].to_i, command_args[1].to_i, command_args[2])
  when "MOVE"
    robot.move()
  when "LEFT"
    robot.left()
  when "RIGHT"
    robot.right()
  when "REPORT"
    output = robot.report()
    puts output unless output == nil
  end
end
