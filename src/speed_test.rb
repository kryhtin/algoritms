# frozen_string_literal: true

require 'benchmark'
require './src/array'
require './src/binary_tree_node'
require './src/tree_node'
require './src/factorial_generator'
require './src/fibonacci_generator'
require './src/happy_number'
require './src/simple_matrix'

array = Array.new(10_000) { rand(1..1000) }

Benchmark.bm do |x|
  x.report('bubble') { array.bubble_sort }
  x.report('counting') { array.counting_sort }
  x.report('quick') { array.quicksort }
  x.report('tree') { array.tree_sort }
  x.report('sort') { array.sort }
end

binary_tree = BinaryTreeNode.new
array.each { |item| binary_tree.insert(item) }

Benchmark.bm do |x|
  x.report('tree') { binary_tree.inorder(&:key) }
end

tree = TreeNode.new
array.each { |int| tree.add(int) }
Benchmark.bm do |x|
  x.report('each') { tree.each(&:data) }
  x.report('get_all') { tree.get_all_nodes }
end

factorial = FactorialGenerator.new
Benchmark.bm do |x|
  x.report('iterator') { factorial.iterator(35) }
  x.report('recursion') { factorial.recursion(35) }
end

fibonacci = FibonacciGenerator.new
Benchmark.bm do |x|
  x.report('iterator') { fibonacci.iterator(35) }
  x.report('recursion') { fibonacci.recursion(35) }
  x.report('fiber') { fibonacci.fiber(35) }
end

happy_number = HappyNumber.new
Benchmark.bm do |x|
  x.report('happy') { happy_number.check(1663) }
end

matrix = SimpleMatrix.new(12, 12, 10)
Benchmark.bm do |x|
  x.report('matrix') { matrix.maximum_string_index }
end
