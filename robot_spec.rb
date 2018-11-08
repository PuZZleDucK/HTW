require "./robot"
require "test/unit/assertions"
include Test::Unit::Assertions

RSpec.describe Robot do

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
