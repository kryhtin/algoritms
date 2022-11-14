# frozen_string_literal: true

require 'rspec'
require './src/binary_tree_node'

describe BinaryTreeNode do
  subject(:tree) { BinaryTreeNode.new(3) }

  describe '.new' do
    context 'when create with value' do
      it 'object is a BinaryTreeNode class' do
        expect(tree).to be_a BinaryTreeNode
      end

      it 'object contains correct key' do
        expect(tree.key).to eq(3)
      end

      it 'return left nil' do
        expect(tree.left).to be_nil
      end

      it 'return right nil' do
        expect(tree.right).to be_nil
      end
    end
  end

  describe '.insert' do
    context 'when insert children greater then root key' do
      it 'add right child' do
        tree.insert(5)
        expect(tree.right.key).to eq(5)
      end
    end

    context 'when insert children less then root key' do
      it 'add left child' do
        tree.insert(2)
        expect(tree.left.key).to eq(2)
      end
    end

    context 'when insert many children' do
      it 'add all child in tree' do
        tree.insert(4)
        tree.insert(8)
        tree.insert(9)
        tree.insert(12)
        tree.insert(2)

        expect(tree.left.key).to eq(2)
      end
    end
  end

  describe '.find' do
    context 'when find children greater then root key' do
      it 'get child object' do
        node = tree.insert(6)
        expect(tree.find(6)).to eq(node)
      end
    end

    context 'when find children less then root key' do
      it 'get child object' do
        node = tree.insert(0)
        expect(tree.find(0)).to eq(node)
      end
    end

    context 'when find undefined key' do
      it 'return nil' do
        expect(tree.find(100)).to be_nil
      end
    end
  end

  describe 'searchers' do
    let(:searcher_tree) {
      searcher_tree = BinaryTreeNode.new(5)
      searcher_tree.insert(1)
      searcher_tree.insert(2)
      searcher_tree.insert(3)
      searcher_tree.insert(4)
      searcher_tree.insert(7)
      searcher_tree.insert(6)
      searcher_tree
    }

    describe '.inorder' do
      context 'traverse the entire tree, following the order: left subtree, root, right subtree' do
        it 'return correct sequence' do
          string = ''.dup
          searcher_tree.inorder { |item| string += item.key.to_s }
          expect(string).to eq('1234567')
        end
      end
    end

    describe '.preorder' do
      context 'traverse the entire tree, following the order: root, left subtree, right subtree' do
        it 'return correct sequence' do
          string = ''.dup
          searcher_tree.preorder { |item| string += item.key.to_s }
          expect(string).to eq('5123467')
        end
      end
    end

    describe '.postorder' do
      context 'traverse the entire tree, following the order: left subtree, right subtree, root' do
        it 'succeeds' do
          string = ''.dup
          searcher_tree.postorder { |item| string += item.key.to_s }
          expect(string).to eq('1234675')
        end
      end
    end
  end
end
