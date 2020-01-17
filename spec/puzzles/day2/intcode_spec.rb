require 'spec_helper'
require_relative '../../../puzzles/day2/intcode'

RSpec.describe Intcode do

  describe '#compute' do
    subject { Intcode.new(instructions: input).compute }

    context 'for 1,0,0,0,99' do
      let(:input) { '1,0,0,0,99' }

      it { is_expected.to eq '2,0,0,0,99' }
    end

    context 'for 2,4,4,5,99,0' do
      let(:input) { '2,4,4,5,99,0' }

      it { is_expected.to eq '2,4,4,5,99,9801' }
    end

    context 'for 2,3,0,3,99' do
      let(:input) { '2,3,0,3,99' }

      it { is_expected.to eq '2,3,0,6,99' }
    end

    context 'for 1,1,1,4,99,5,6,0,99' do
      let(:input) { '1,1,1,4,99,5,6,0,99' }

      it { is_expected.to eq '30,1,1,4,2,5,6,0,99' }
    end

  end

end
