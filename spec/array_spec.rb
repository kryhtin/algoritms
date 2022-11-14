# frozen_string_literal: true

require 'rspec'
require './src/array'

describe Array do
  let(:positive_array) { (1..10).to_a.reverse }
  let(:positive_result) { (1..10).to_a }
  let(:empty_array) { [] }
  let(:negative_array) { (-10..-1).to_a.shuffle }
  let(:negative_result) { [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1] }
  let(:big_array) { Array.new(1000) { rand(1..1000) } }

  describe '.bubble_sort' do
    context 'given unsorted array' do
      it 'return sorted array' do
        expect(positive_array.bubble_sort).to eq(positive_result)
      end
    end

    context 'given empty array' do
      it 'return empty array' do
        expect(empty_array.bubble_sort).to eq(empty_array)
      end
    end

    context 'given negative value array' do
      it 'return sorted array' do
        expect(negative_array.bubble_sort).to eq(negative_result)
      end
    end

    context 'given big array' do
      it 'return correct sorted array' do
        expect(big_array.bubble_sort).to eq(big_array.sort)
      end
    end
  end

  describe '.counting_sort' do
    context 'given unsorted array' do
      it 'return sorted array' do
        expect(positive_array.counting_sort).to eq(positive_result)
      end
    end

    context 'given empty array' do
      it 'return empty array' do
        expect(empty_array.counting_sort).to eq(empty_array)
      end
    end

    context 'given negative value array' do
      it 'return sorted array' do
        expect(negative_array.counting_sort).to eq(negative_result)
      end
    end

    context 'given big array' do
      it 'return correct sorted array' do
        expect(big_array.counting_sort).to eq(big_array.sort)
      end
    end
  end

  describe '.quicksort' do
    context 'given unsorted array' do
      it 'return sorted array' do
        expect(positive_array.quicksort).to eq(positive_result)
      end
    end

    context 'given empty array' do
      it 'return empty array' do
        expect(empty_array.quicksort).to eq(empty_array)
      end
    end

    context 'given negative value array' do
      it 'return sorted array' do
        expect(negative_array.quicksort).to eq(negative_result)
      end
    end

    context 'given big array' do
      it 'return correct sorted array' do
        expect(big_array.quicksort).to eq(big_array.sort)
      end
    end
  end

  describe '.tree_sort' do
    context 'given unsorted array' do
      it 'return sorted array' do
        expect(positive_array.tree_sort).to eq(positive_result)
      end
    end

    context 'given empty array' do
      it 'return empty array' do
        expect(empty_array.tree_sort).to eq(empty_array)
      end
    end

    context 'given negative value array' do
      it 'return sorted array' do
        expect(negative_array.tree_sort).to eq(negative_result)
      end
    end

    context 'given big array' do
      it 'return correct sorted array' do
        expect(big_array.tree_sort).to eq(big_array.uniq.sort)
      end
    end
  end
end
