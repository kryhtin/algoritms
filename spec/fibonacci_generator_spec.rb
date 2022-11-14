# frozen_string_literal: true

require 'rspec'
require './src/fibonacci_generator'

describe FibonacciGenerator do
  subject(:generator) { FibonacciGenerator.new }
  let(:sequence10) { [1, 1, 2, 3, 5, 8, 13, 21, 34, 55] }
  let(:sequence1) { [1] }

  describe '.iterator' do
    context 'when number 10' do
      it 'return fibonacci sequence for number 10' do
        expect(generator.iterator(10)).to eq(sequence10)
      end
    end

    context 'when number 1' do
      it 'return fibonacci sequence for number 1' do
        expect(generator.iterator(1)).to eq(sequence1)
      end
    end

    context 'when number 0' do
      it 'raise error ArgumentError' do
        expect { generator.iterator(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when negative integer' do
      it 'raise error ArgumentError' do
        expect { generator.iterator(-10) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.fiber' do
    context 'when number 10' do
      it 'return fibonacci sequence for number 10' do
        expect(generator.fiber(10)).to eq(sequence10)
      end
    end

    context 'when number 1' do
      it 'return fibonacci sequence for number 1' do
        expect(generator.fiber(1)).to eq(sequence1)
      end
    end

    context 'when number 0' do
      it 'raise error ArgumentError' do
        expect { generator.fiber(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when negative integer' do
      it 'raise error ArgumentError' do
        expect { generator.fiber(-10) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.recursion' do
    context 'when number 10' do
      it 'return fibonacci sequence for number 10' do
        expect(generator.recursion(10)).to eq(sequence10)
      end
    end

    context 'when number 1' do
      it 'return fibonacci sequence for number 1' do
        expect(generator.recursion(1)).to eq(sequence1)
      end
    end

    context 'when number 0' do
      it 'raise error ArgumentError' do
        expect { generator.recursion(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when negative integer' do
      it 'raise error ArgumentError' do
        expect { generator.recursion(-10) }.to raise_error(ArgumentError)
      end
    end
  end
end
