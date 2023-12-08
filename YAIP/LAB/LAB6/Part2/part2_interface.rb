# frozen_string_literal: true

require './part2'

def output(num, precision)
  value = count_sin_with_precision(num, precision)
  puts "sin(#{num}) = #{value} with precision #{precision}"
end

puts 'Enter x:'
x = gets.to_f
output(x, 1e-3)
