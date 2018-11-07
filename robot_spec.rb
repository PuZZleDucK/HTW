require "./robot"
require "test/unit/assertions"
include Test::Unit::Assertions

RSpec.describe Robot do

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
