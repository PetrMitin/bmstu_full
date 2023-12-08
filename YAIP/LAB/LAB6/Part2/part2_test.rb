# frozen_string_literal: true

require 'minitest/autorun'
require './part2'

# Tests for part 2 of lab6
class Part2Tests < Minitest::Test
  def test_one
    5.times do
      x = rand * Math::PI * 2
      exact_value = Math.sin(x)
      precision = 10**rand(-10..-1)
      value = count_sin_with_precision(x, precision)
      assert((exact_value - value).abs < precision)
    end
  end
end
