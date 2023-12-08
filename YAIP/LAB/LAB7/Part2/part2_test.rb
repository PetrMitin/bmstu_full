# frozen_string_literal: true

require './part2'
require 'minitest/autorun'

# test for part2 of lab7
class Part2Tests < Minitest::Test
  def test_word_with_length_hierarchy
    word = Word.new('')
    word_with_length = WordWithLength.new('')
    assert(word.instance_of?(word_with_length.class.superclass))
  end
end
