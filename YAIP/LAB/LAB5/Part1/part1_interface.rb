# frozen_string_literal: true

require './part1'

puts 'Enter x:'
x = gets.to_f
puts "y(#{x}) = #{count_expression(x)}"
