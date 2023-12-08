# frozen_string_literal: true

require 'minitest/autorun'
require './part3'

# Tests for part 3 of lab6
class Part3Tests < Minitest::Test
  def test_lambda
    lambda_f = ->(x) { Math.cos(x) }
    assert(neibr_lambda(0, 1, lambda_f))
    assert(!neibr_lambda(Math::PI, 1, lambda_f))
  end

  def test_block
    assert(neibr_block(0, 0) { |x| Math.sin(x**2) })
    assert(!neibr_block(0, 1) { |x| Math.sin(x**2) })
  end
end
