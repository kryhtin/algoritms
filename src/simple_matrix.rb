# frozen_string_literal: true

# SimpleMatrix
class SimpleMatrix
  attr_reader :data, :width, :height

  def initialize(width = 3, height = 3, max = 10)
    raise ArgumentError unless width.is_a?(Integer) && width.positive?
    raise ArgumentError unless height.is_a?(Integer) && height.positive?
    raise ArgumentError unless max.is_a?(Integer) && max.positive?

    @width = width
    @height = height
    @max = max
    fill
  end

  def maximum_string_index
    sum_array = []
    data.each { |item| sum_array << item.sum }
    sum_array.rindex(sum_array.max)
  end

  private

  def fill
    @data = Array.new(@height)
    @data.each_index { |i| @data[i] = Array.new(@width) { rand(1..@max) } }
  end
end