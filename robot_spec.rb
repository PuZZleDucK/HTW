require "./robot"
require "test/unit/assertions"
include Test::Unit::Assertions

RSpec.describe Robot do
  describe 'Tautology' do
    it 'always evaluates to true' do
      expect(true).to eq(true)
    end
  end

end
