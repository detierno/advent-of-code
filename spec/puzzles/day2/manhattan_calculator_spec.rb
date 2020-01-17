require 'spec_helper'
require_relative '../../../puzzles/day3/manhattan_calculator'

RSpec.describe ManhattanCalculator do

  describe '#compute' do
    subject { ManhattanCalculator.new(input_a, input_b).compute }

    let(:input_a) { 'R75,D30,R83,U83,L12,D49,R71,U7,L72' }
    let(:input_b) { 'U62,R66,U55,R34,D71,R55,D58,R83' }

    it 'is equal to 159' do
      is_expected.to eq 159
    end
  end

end
