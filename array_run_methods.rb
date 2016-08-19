#  add comment
require_relative 'my_enumerable'

Array.include MyEnumerable

puts "Manual Test of #my_map"
p [1,2,3].my_map { |x| x * 50 }
p ['a','b','c'].my_map(:upcase)
p ['A','B','C'].my_map(&:downcase)

puts 

puts "Manual Test of #my_reduce"
puts [1,2,3,4,5].my_reduce(0,:+)
puts [1,2,3,4,5].my_reduce { |acc, value| acc + value }
puts [1,2,3,4,5].my_reduce(100) { |acc, value| acc + value }
