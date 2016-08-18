#  add comment
require_relative 'my_enumerable'

Array.include MyEnumerable

p [1,2,3].my_map { |x| x * 50 }

puts

p ['a','b','c'].my_map(:upcase)

puts

p ['A','B','C'].my_map(&:downcase)
