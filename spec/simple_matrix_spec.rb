# frozen_string_literal: true

require 'rspec'
require './src/simple_matrix'

describe SimpleMatrix do
  subject(:matrix) { SimpleMatrix.new(3, 3, 10) }

  describe '.new' do
    context 'when set incorrect width' do
      it 'raise error ArgumentError' do
        expect { SimpleMatrix.new(-3, 3, 10) }.to raise_error(ArgumentError)
      end
    end

    context 'when set incorrect height' do
      it 'raise error ArgumentError' do
        expect { SimpleMatrix.new(3, -3, 10) }.to raise_error(ArgumentError)
      end
    end

    context 'when set incorrect max value' do
      it 'raise error ArgumentError' do
        expect { SimpleMatrix.new(3, 3, -10) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.maximum_string_index' do
    context 'when set correct matrix values' do
      it 'return index 2' do
        allow(matrix).to receive(:data).and_return([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        expect(matrix.maximum_string_index).to eq 2
      end
    end
  end
end
