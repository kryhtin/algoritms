# frozen_string_literal: true

# FibonacciGenerator
class FibonacciGenerator
  def iterator(number)
    raise ArgumentError unless number.is_a?(Integer) && number.positive?

    first = 0
    second = 1
    array = []
    number.times do
      first, second = second, first + second
      array << first
    end
    array
  end

  def fiber(number)
    raise ArgumentError unless number.is_a?(Integer) && number.positive?

    first = 0
    second = 1
    array = []

    fiber = Fiber.new do
      loop do
        first, second = second, first + second
        Fiber.yield first
      end
    end

    number.times { array << fiber.resume }
    array
  end

  def recursion(number)
    raise ArgumentError unless number.is_a?(Integer) && number.positive?

    array = []
    1.upto(number) { |n| array << generate(n) }
    array
  end

  private

  def generate(number)
    return number if number <= 1

    generate(number - 1) + generate(number - 2)
  end
end
