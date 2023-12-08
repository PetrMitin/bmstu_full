# frozen_string_literal: true

require './part3'

def output
  lambda_f = ->(x) { Math.cos(x) }
  points = [[0, 1], [1, 0], [1, 1], [0, 0], [Math::PI, 0], [Math::PI / 2, 1], [-Math::PI, 0], [-Math::PI / 2, 1], [Math::PI, 1], [-Math::PI, -1]]
  points.each do |point|
    puts neibr_lambda(point[0], point[1], lambda_f)
    puts neibr_block(point[0], point[1]) { |x| Math.sin(x**2) }
  end
end

output
