require 'spec_helper'
require_relative '../../../puzzles/day1/fuel_calculator'

RSpec.describe FuelCalculator do

  describe '#compute' do
    subject { FuelCalculator.new(file).fuel_total }

    def create_file(input)
      (StringIO.new << "#{input}\n").tap { |f| f.rewind }
    end

    context 'for mass of 12' do
      let(:file) { create_file('12') }

      it { is_expected.to eq 2 }
    end

    context 'for mass of 1969' do
      let(:file) { create_file('1969') }

      it { is_expected.to eq 966 }
    end

    context 'for mass of 100756' do
      let(:file) { create_file('100756') }

      it { is_expected.to eq 50346 }
    end
  end

end
