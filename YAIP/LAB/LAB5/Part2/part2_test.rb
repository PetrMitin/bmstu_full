# frozen_string_literal: true

require 'minitest/autorun'
require './part2'

# Tests for part 2 of lab5
class Part2Tests < Minitest::Test
  def test_one
    x = 15
    value = count_digits_and_letters_hex(x)
    puts "count_digits_and_letters_hex(#{x}) = #{value}"
    assert_equal(value, [1, 0])
  end

  def test_two
    x = 16
    value = count_digits_and_letters_hex(x)
    puts "count_digits_and_letters_hex(#{x}) = #{value}"
    assert_equal(value, [0, 2])
  end

  def test_three
    x = 170
    value = count_digits_and_letters_hex(x)
    puts "count_digits_and_letters_hex(#{x}) = #{value}"
    assert_equal(value, [2, 0])
  end

  def test_four
    x = 322_228
    value = count_digits_and_letters_hex(x)
    puts "count_digits_and_letters_hex(#{x}) = #{value}"
    assert_equal(value, [3, 2])
  end
end
