# frozen_string_literal: true

require 'rspec'
require './src/factorial_generator'

describe FactorialGenerator do
  subject(:generator) { FactorialGenerator.new }

  describe '.iterator' do
    context 'when number 10' do
      it 'return factorial 3_628_800' do
        expect(generator.iterator(10)).to eq(3_628_800)
      end
    end

    context 'when number 1' do
      it 'return factorial 1' do
        expect(generator.iterator(1)).to eq(1)
      end
    end

    context 'when number 0' do
      it 'return factorial 1' do
        expect(generator.iterator(0)).to eq(1)
      end
    end

    context 'when number negative' do
      it 'raise error ArgumentError' do
        expect { generator.iterator(-10) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.recursion' do
    context 'when number 10' do
      it 'return factorial 3_628_800' do
        expect(generator.recursion(10)).to eq(3_628_800)
      end
    end

    context 'when number 1' do
      it 'return factorial 1' do
        expect(generator.recursion(1)).to eq(1)
      end
    end

    context 'when number 0' do
      it 'return factorial 1' do
        expect(generator.recursion(0)).to eq(1)
      end
    end

    context 'when number negative' do
      it 'raise error ArgumentError' do
        expect { generator.recursion(-10) }.to raise_error(ArgumentError)
      end
    end
  end
end
