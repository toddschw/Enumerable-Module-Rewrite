#  add comment
require_relative 'my_enumerable'

Array.include MyEnumerable

puts [1,2,3].my_map(:even?)
