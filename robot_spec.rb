require "./robot"
require "test/unit/assertions"
include Test::Unit::Assertions

RSpec.describe Robot do

  describe 'Report' do
    it 'no report before placement' do
      r = Robot.new()
      expect(r.report()).to eq(nil)
    end

    it 'basic report usage' do
      r = Robot.new()
      r.place(4,2,"NORTH")
      expect(r.report()).to eq("4,2,NORTH")
    end
  end

  describe 'Move' do
    it 'movment off north edge prevented' do
      r = Robot.new()
      r.place(4,2,"NORTH")
      r.move()
      expect(r.x_location).to eq(4)
      expect(r.y_location).to eq(2)
      expect(r.facing).to eq("NORTH")
    end

    it 'movment off east edge prevented' do
      r = Robot.new()
      r.place(4,4,"EAST")
      r.move()
      expect(r.x_location).to eq(4)
      expect(r.y_location).to eq(4)
      expect(r.facing).to eq("EAST")
    end

    it 'movment off south edge prevented' do
      r = Robot.new()
      r.place(0,2,"SOUTH")
      r.move()
      expect(r.x_location).to eq(0)
      expect(r.y_location).to eq(2)
      expect(r.facing).to eq("SOUTH")
    end

    it 'movment off west edge prevented' do
      r = Robot.new()
      r.place(4,0,"WEST")
      r.move()
      expect(r.x_location).to eq(4)
      expect(r.y_location).to eq(0)
      expect(r.facing).to eq("WEST")
    end

    it 'move before place has no effect' do
      r = Robot.new()
      r.move()
      r.place(1,2,"NORTH")
      expect(r.x_location).to eq(1)
      expect(r.y_location).to eq(2)
      expect(r.facing).to eq("NORTH")
    end

    it 'basic movment north' do
      r = Robot.new()
      r.place(1,2,"NORTH")
      r.move()
      expect(r.x_location).to eq(2)
      expect(r.y_location).to eq(2)
      expect(r.facing).to eq("NORTH")
    end

    it 'basic movment east' do
      r = Robot.new()
      r.place(1,2,"EAST")
      r.move()
      expect(r.x_location).to eq(1)
      expect(r.y_location).to eq(3)
      expect(r.facing).to eq("EAST")
    end

    it 'basic movment south' do
      r = Robot.new()
      r.place(1,2,"SOUTH")
      r.move()
      expect(r.x_location).to eq(0)
      expect(r.y_location).to eq(2)
      expect(r.facing).to eq("SOUTH")
    end

    it 'basic movment west' do
      r = Robot.new()
      r.place(1,2,"WEST")
      r.move()
      expect(r.x_location).to eq(1)
      expect(r.y_location).to eq(1)
      expect(r.facing).to eq("WEST")
    end
  end

  describe 'Turn' do
    it 'turning unplaced robot has no effect' do
      r = Robot.new()
      r.left()
      r.left()
      expect(r.facing).to eq("")
      r.right()
      expect(r.facing).to eq("")
      r.place(1,2,"NORTH")
      expect(r.facing).to eq("NORTH")
    end

    it 'turning full circle left' do
      r = Robot.new()
      r.place(1,2,"NORTH")
      r.left()
      expect(r.facing).to eq("WEST")
      r.left()
      expect(r.facing).to eq("SOUTH")
      r.left()
      expect(r.facing).to eq("EAST")
      r.left()
      expect(r.facing).to eq("NORTH")
    end

    it 'turning full circle right' do
      r = Robot.new()
      r.place(1,2,"NORTH")
      r.right()
      expect(r.facing).to eq("EAST")
      r.right()
      expect(r.facing).to eq("SOUTH")
      r.right()
      expect(r.facing).to eq("WEST")
      r.right()
      expect(r.facing).to eq("NORTH")
    end

    it 'turning a placed robot left updates facing' do
      r = Robot.new()
      r.place(1,2,"NORTH")
      r.left()
      expect(r.facing).to eq("WEST")
    end

    it 'turning a placed robot right updates facing' do
      r = Robot.new()
      r.place(1,2,"NORTH")
      r.right()
      expect(r.facing).to eq("EAST")
    end
  end

  describe 'Place' do
    it 'place command results in updated coords' do
      r = Robot.new()
      r.place(1,2,"NORTH")
      expect(r.x_location).to eq(1)
      expect(r.y_location).to eq(2)
      expect(r.facing).to eq("NORTH")
    end

    it 'negative place command does not update' do
      r = Robot.new()
      r.place(-1,2,"NORTH")
      expect(r.x_location).to eq(-1)
      expect(r.y_location).to eq(-1)
      expect(r.facing).to eq("")
    end

    it 'high place command does not update' do
      r = Robot.new()
      r.place(1,20,"NORTH")
      expect(r.x_location).to eq(-1)
      expect(r.y_location).to eq(-1)
      expect(r.facing).to eq("")
    end

    it 'invalid facing command does not update' do
      r = Robot.new()
      r.place(1,2,"UP")
      expect(r.x_location).to eq(-1)
      expect(r.y_location).to eq(-1)
      expect(r.facing).to eq("")
    end
  end

  describe 'Tautology' do
    it 'always evaluates to true' do
      expect(true).to eq(true)
    end
  end

end
