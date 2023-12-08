# frozen_string_literal: true

require 'minitest/autorun'
require './part1'

# Tests for part 1 of lab5
class TestPart1 < Minitest::Test
  def test_zero
    value = count_expression(0)
    puts "y(0) = #{value}"
    assert_equal(value, 2 / 3)
  end

  def test_pi_by_two
    value = count_expression(Math::PI / 2)
    puts "y(pi/2) = #{value}"
    assert_equal(value, -0.20710678118654757)
  end

  def test_pi
    value = count_expression(Math::PI)
    puts "y(pi) = #{value}"
    assert_equal(value, 0)
  end

  def test_three_pi_by_two
    value = count_expression(3 * Math::PI / 2)
    puts "y(3*pi/2) = #{value}"
    assert_equal(value, -0.20710678118654757)
  end
end
