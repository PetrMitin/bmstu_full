# frozen_string_literal: true

require './part1'
require 'minitest/autorun'

# Tests for part 1 of lab6
class Part1Test < Minitest::Test
  def test_one
    5.times do
      x = rand * Math::PI * 2
      exact_value = Math.sin(x)
      precision = 10**rand(-10..-1)
      value = count_sin_with_precision(x, precision)[0]
      assert((exact_value - value).abs < precision)
    end
  end
end
