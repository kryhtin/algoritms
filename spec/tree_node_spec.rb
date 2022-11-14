# frozen_string_literal: true

require 'rspec'
require './src/tree_node'

describe TreeNode do
  describe '.new' do
    subject(:tree) { TreeNode.new }

    context 'when create without arguments' do
      it 'object is a TreeNode class' do
        is_expected.to be_a TreeNode
      end

      it 'return nil tree data' do
        expect(tree.data).to be_nil
      end

      it 'children is a Array class' do
        expect(tree.children).to be_a Array
      end

      it 'children be empty' do
        expect(tree.children).to be_empty
      end
    end
  end

  describe '.add' do
    subject(:tree) { TreeNode.new }

    context 'when add range symbols a..z' do
      it 'return correct length 26' do
        ('a'..'z').each { |sym| tree.add(sym) }
        expect(tree.get_all_nodes.length).to eq(26)
      end
    end

    context 'when add range integers 1..3' do
      it 'return correct length 3' do
        (1..3).each { |int| tree.add(int) }
        expect(tree.get_all_nodes.length).to eq(3)
      end
    end
  end

  describe '.each' do
    let(:tree) do
      tree = TreeNode.new
      ('a'..'d').each { |sym| tree.add(sym) }
      tree
    end

    context 'when each all nodes' do
      it 'return correct sequence abcd' do
        expect_sequence_string = ''
        tree.each { |node| expect_sequence_string += node.data }
        expect(expect_sequence_string).to eq('abcd')
      end
    end

    context 'when call without block' do
      it 'raise error ArgumentError' do
        expect { tree.each }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.get_all_nodes' do
    let(:tree) do
      tree = TreeNode.new
      ('a'..'z').each { |sym| tree.add(sym) }
      tree
    end

    context 'when correct tree with nodes' do
      it 'return correct array length 26' do
        expect(tree.get_all_nodes.length).to eq(26)
      end
    end

    context 'when empty tree' do
      it 'return correct array length 1' do
        node = TreeNode.new
        expect(node.get_all_nodes.length).to eq(1)
      end
    end
  end
end
