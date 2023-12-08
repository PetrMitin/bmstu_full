# frozen_string_literal: true

require './part1'
require 'minitest/autorun'

# part1 tests for lab7
class Part1Tests < Minitest::Test
  def initialize(arg)
    super
    @input_file = 'f.txt'
    @output_file = 'h.txt'
  end

  def test_files_existance
    assert(File.exist?(@input_file))
    assert(File.exist?(@output_file))
  end

  def test_file_accessibility
    assert(File.readable?(@input_file))
    assert(File.writable?(@output_file))
  end

  def test_method
    File.write(@input_file, 'lkjlkjlkaljjlnahghauyutnbartrytagvgvgacca')
    write_symbols_after_a(@input_file, @output_file)
    assert(File.read(@output_file) == 'knhbtgc')
  end
end
