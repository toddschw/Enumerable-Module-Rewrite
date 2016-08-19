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

puts "\nManual Test of #my_all"
p [1,2,3,4,5,6,7,8,9,10].my_all { |x| x > 4 }

puts "\nManual Test of #my_any"
p [1,2,3,4,5,6,7,8,9,10].my_any { |x| x > 9 }

puts "\nManual Test of #my_count"
p [1,2,3,4,5,6].my_count
p [nil,false,3,4,5,6,7].my_count
p [false,2,nil,4,5,6,7,8].my_count(4)
p ['b',2,'b',4,5,6,7,9].my_count { |x| x == 'b' }
p ['b',2,'b',4,5,6,7,9].my_count{ |x| x % 2 == 0 }

puts "\nManual Test of #my_detect"
p [1,2,3,4,5].my_detect { |x| x % 9 == 0 }
p (1..100).to_a.my_detect { |i| i % 5 == 0 and i % 7 == 0 }



