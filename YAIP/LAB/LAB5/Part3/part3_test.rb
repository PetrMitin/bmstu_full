# frozen_string_literal: true

require './part3'
require 'minitest/autorun'

# Tests for part 3 of lab5
class Part3Test < Minitest::Test
  def setup
    words_array = 10.times.map { "#{(0..4).map { random_cyrillic_char }.join}#{e_or_o}нок" }
    @str = words_array.join(' ')
    puts @str
  end

  def random_cyrillic_char
    rand(1072...1103).chr(Encoding::UTF_8)
  end

  def e_or_o
    rand(0..2).zero? ? 'е' : 'о'
  end

  def test_one
    output(@str)
  end
end
