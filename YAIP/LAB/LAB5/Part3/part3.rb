# frozen_string_literal: true

def zh_sh?(char)
  !!/[жЖшШчЧщЩ]/.match(char)
end

def transform_string_to_plural(str)
  arr = str.split(' ').map { |word| zh_sh?(word[-5]) ? "#{word[0..-5]}ата" : "#{word[0..-5]}ята" }
  arr.join(' ')
end

def output(str)
  puts "Initial string: #{str}"
  puts "Transformed string: #{transform_string_to_plural(str)}"
end
