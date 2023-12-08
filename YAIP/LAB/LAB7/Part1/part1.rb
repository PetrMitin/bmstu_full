# frozen_string_literal: true

def write_symbols_after_a(input_file = 'f.txt', output_file = 'h.txt')
  str = File.read(input_file)
  str_ans = ''
  str.split('a').each { |substr| str_ans += substr[-1] }
  File.write(output_file, str_ans)
  [str, str_ans]
end
