# frozen_string_literal: true

require './part1'

def output(num, precision)
  value, n = count_sin_with_precision(num, precision)
  puts "sin(#{num}) = #{value} with precision #{precision}, number of iterations = #{n}"
end

puts 'Enter x:'
x = gets.to_f
output(x, 1e-3)
