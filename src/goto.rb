# frozen_string_literal: true

require 'continuation'

$lines = {}

def line(symbol)
  callcc { |c| $lines[symbol] = c }
end

def goto(symbol)
  $lines[symbol].call
end

i = 0
line 10
puts i += 1
goto 10 if i < 5
