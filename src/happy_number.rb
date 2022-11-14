# frozen_string_literal: true

# HappyNumber
class HappyNumber
  def check(number)
    raise ArgumentError unless number.is_a? Integer
    raise ArgumentError unless number.positive?

    sum = number.digits.map { |i| i**2 }.sum
    return true if sum == 1

    check(sum)
  rescue SystemStackError
    false
  end
end