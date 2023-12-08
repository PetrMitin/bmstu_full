# frozen_string_literal: true

def fact(num)
  num < 2 ? 1 : fact(num - 1) * num
end

def count_sin_with_precision(num, precision)
  value = 0
  prevvalue = 100
  n = 0
  until (value - prevvalue).abs < precision
    prevvalue = value
    curr_member = (-1)**n * num**(2 * n + 1) / fact(n * 2 + 1)
    value += curr_member
    n += 1
  end
  [value, n]
end
