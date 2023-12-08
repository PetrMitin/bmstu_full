# frozen_string_literal: true

# word
class Word
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def print_word
    puts @word
  end

  def count_number_of_vowels
    @word.count('aeuioAEUIO')
  end
end

# word with length
class WordWithLength < Word
  undef_method :count_number_of_vowels
  attr_reader :length

  def initialize(word)
    super(word)
    @length = word.length
  end

  def print_length
    puts @length
  end

  def count_number_of_consonants
    @word.count('^aeuioAEUIO')
  end
end
