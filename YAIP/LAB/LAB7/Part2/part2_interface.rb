# frozen_string_literal: true

require './part2'

def output
  word = Word.new('Psina')
  word_with_length = WordWithLength.new('Sutulaya')
  puts word.word
  puts word_with_length.word
  puts word_with_length.length
  word.print_word
  word_with_length.print_word
  word_with_length.print_length
  puts "Vowels #{word.count_number_of_vowels}"
  puts "Cons #{word_with_length.count_number_of_consonants}"
end

output
