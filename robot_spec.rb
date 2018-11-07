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
  end

  describe 'Tautology' do
    it 'always evaluates to true' do
      expect(true).to eq(true)
    end
  end

end
