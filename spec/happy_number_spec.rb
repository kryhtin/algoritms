# frozen_string_literal: true

require 'rspec'
require './src/happy_number'

describe HappyNumber do
  subject(:happy_number) { HappyNumber.new }

  describe '.check' do
    context 'given an number 988' do
      it 'returns false' do
        expect(happy_number.check(988)).to eq(false)
      end
    end

    context 'given an number 998' do
      it 'returns true' do
        expect(happy_number.check(998)).to eq(true)
      end
    end

    context 'given an number 0' do
      it 'raise error ArgumentError' do
        expect { happy_number.check(0) }.to raise_error(ArgumentError)
      end
    end

    context 'given an number -20' do
      it 'raise error ArgumentError' do
        expect { happy_number.check(-20) }.to raise_error(ArgumentError)
      end
    end

    context 'given an number 23.5' do
      it 'raise error ArgumentError' do
        expect { happy_number.check(23.5) }.to raise_error(ArgumentError)
      end
    end
  end
end
