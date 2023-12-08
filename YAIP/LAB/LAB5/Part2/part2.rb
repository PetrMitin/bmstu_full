# frozen_string_literal: true

def count_digits_and_letters_hex(num)
  hex_val = num.to_s(16)
  letters_amount = hex_val.count('a-z')
  digits_amount = hex_val.count('0-9')
  [letters_amount, digits_amount]
end
