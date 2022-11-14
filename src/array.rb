# frozen_string_literal: true

require './src/binary_tree_node'

# Adding sorting methods to the Array class
class Array
  def bubble_sort
    return [] if empty?

    size = length - 1
    array = dup

    (0..length).each do |i|
      (0..(size - i - 1)).each do |j|
        array[j], array[j + 1] = array[j + 1], array[j] if array[j] > array[j + 1]
      end
    end
    array
  end

  def counting_sort
    return [] if empty?

    array_max = max
    array_min = min
    markings = [0] * (array_max - array_min + 1)

    each do |a|
      markings[a - array_min] += 1
    end

    result = []
    markings.length.times do |i|
      markings[i].times do
        result << i + array_min
      end
    end
    result
  end

  def quicksort
    return [] if empty?

    array = dup
    p_index = partition(array, 0, rindex(last))
    quicksort_recursion(array, 0, p_index - 1)
    quicksort_recursion(array, p_index + 1, rindex(last))

    array
  end

  def tree_sort
    sorted_array = []
    tree = BinaryTreeNode.new
    each { |item| tree.insert(item) }
    tree.inorder { |item| sorted_array << item.key unless item.key.nil? }
    sorted_array
  end

  private

  def quicksort_recursion(array, first, last)
    if first < last
      p_index = partition(array, first, last)
      quicksort_recursion(array, first, p_index - 1)
      quicksort_recursion(array, p_index + 1, last)
    end

    array
  end

  def partition(arr, first, last)
    pivot = arr[last]
    p_index = first

    i = first
    while i < last
      if arr[i] <= pivot
        temp = arr[i]
        arr[i] = arr[p_index]
        arr[p_index] = temp
        p_index += 1
      end
      i += 1
    end
    temp = arr[p_index]
    arr[p_index] = pivot
    arr[last] = temp
    p_index
  end
end
