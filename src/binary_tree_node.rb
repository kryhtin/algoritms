# frozen_string_literal: true

# Binary search Tree
class BinaryTreeNode
  attr_accessor :key, :left, :right

  def initialize(value = nil)
    @key = value
    @left = nil
    @right = nil
  end

  def find(value, node = self)
    return nil if node.nil?
    return node if node.key == value
    return find(value, node.right) if value > node.key

    find(value, node.left) if value < node.key
  end

  def insert(value, node = self)
    node.key = value if node.key.nil?

    return insert(value, node.right ||= BinaryTreeNode.new(value)) if value > node.key
    return insert(value, node.left ||= BinaryTreeNode.new(value)) if value < node.key

    node.key = value if node.key == value
    node
  end

  def inorder(node = self, &block)
    return if node.nil?

    inorder(node.left, &block)
    yield(node)
    inorder(node.right, &block)
  end

  def preorder(node = self, &block)
    return if node.nil?

    yield(node)
    inorder(node.left, &block)
    inorder(node.right, &block)
  end

  def postorder(node = self, &block)
    return if node.nil?

    inorder(node.left, &block)
    inorder(node.right, &block)
    yield(node)
  end
end
