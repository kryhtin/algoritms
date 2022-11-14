# frozen_string_literal: true

# FactorialGenerator
class FactorialGenerator
  def iterator(number)
    raise ArgumentError unless number.is_a?(Integer) && number >= 0

    @res = 1
    (1..number).each do |i|
      @res *= i
    end
    @res
  end

  def recursion(number)
    raise ArgumentError unless number.is_a?(Integer) && number >= 0
    return 1 if number.zero?

    number * recursion(number - 1)
  end
end
