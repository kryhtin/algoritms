# frozen_string_literal: true

# class TreeNode
class TreeNode
  include Enumerable

  attr_accessor :children, :data

  def initialize(data = nil)
    @data = data
    @children = []
    @nodes = []
  end

  def add(value, node = self)
    return node.data = value if node.data.nil?
    return node.children << TreeNode.new(value) if node.children.length < 3

    add(value, node.children.sample)
  end

  def each(&block)
    raise ArgumentError, 'No block given' unless block_given?

    block.call(self)
    @children.each { |node| node.each(&block) }
  end

  def get_all_nodes(node = self)
    @nodes << node
    node.children.each do |child_node|
      @nodes + get_all_nodes(child_node)
    end
    @nodes
  end
end
