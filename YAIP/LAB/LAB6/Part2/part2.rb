# frozen_string_literal: true

def fact(num)
  num < 2 ? 1 : fact(num - 1) * num
end

# counts sin of num with precision, returning enum
def count_sin_with_precision(num, precision)
  list = Enumerator.new do |yielder|
    sum = 0
    prev = 100
    counter = 0
    loop do
      yielder.yield sum, prev, counter
      prev = sum
      sum += (-1)**counter * num**(2 * counter + 1) / fact(counter * 2 + 1)
      counter += 1
    end
  end
  list.take_while { |sum, prev| (sum - prev).abs >= precision }.last[0]
end
