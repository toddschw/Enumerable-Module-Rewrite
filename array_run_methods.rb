#  add comment
require_relative 'my_enumerable'

Array.include MyEnumerable

puts "\nManual Test of #my_map"
p [1,2,3].my_map { |x| x * 50 }
p ['a','b','c'].my_map(:upcase)
p ['A','B','C'].my_map(&:downcase)

puts "\nManual Test of #my_reduce"
puts [1,2,3,4,5].my_reduce(0,:+)
puts [1,2,3,4,5].my_reduce { |acc, value| acc + value }
puts [1,2,3,4,5].my_reduce(100) { |acc, value| acc + value }

puts "\nManual Test of #my_select"
p [1,2,3,4,5,6,7,8,9,10].my_select(:odd?)
p [1,2,3,4,5,6,7,8,9,10].my_select(&:even?)
p [1,2,3,4,5,6,7,8,9,10].my_select { |value| value % 3 == 0 }

puts "\nManual Test of #my_reject"
p [1,2,3,4,5,6,7,8,9,10].my_reject(:odd?)
p [1,2,3,4,5,6,7,8,9,10].my_reject(&:even?)
p [1,2,3,4,5,6,7,8,9,10].my_reject { |value| value % 3 == 0 }