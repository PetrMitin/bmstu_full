# frozen_string_literal: true

require './part2'

puts 'Enter decimal number:'
x = gets.to_i
letters_amount, digits_amount = count_digits_and_letters_hex(x)
puts "\n#{x} to hexidecimal is #{x.to_s(16)}"
puts "There are #{letters_amount} letters and #{digits_amount} digits in hexidecimal representation of #{x}"
