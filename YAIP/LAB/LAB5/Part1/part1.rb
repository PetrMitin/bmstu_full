# frozen_string_literal: true

def count_expression(num)
  (1 - Math.sqrt(1 + Math.sin(num).abs)) / (2 + Math.cos(num)**2)
end
