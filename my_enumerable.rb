# Todd Schwartzfarb

# Recreate the Enumerable Module
# or at least a bunch of its methods
# as a coding exercise
# Inspired by this post:
# https://blog.codeship.com/the-enumerable-module/

# Enumerable Methods to recreate:
# ________________________________
# all
# any
# chunk
# chunk_while
# collect
# collect_concat
# count
# cycle
# detect
# drop
# drop_while
# each_cons
# each_entry
# each_slice
# each_with_index
# each_with_object
# entries
# find
# find_all
# find_index
# first
# flat_map
# group_by
# include?
# inject
# lazy
# map
# max
# max_by
# member?
# none?
# partition
# reduce
# reject
# reverse_each
# select
# slice_after
# slice_before
# slice_when
# take
# take_while
# to_a
# to_h
# zip


module MyEnumerable

  # map, collect
  # ********************************************************
  # we want to be able to call it 3 ways
  # Way #1: ['a','b','c'].my_map(:upcase)
  # Way #2: ['a','b','c'].my_map { |i| i.upcase }
  # Way #3: ['a','b','c'].my_map(&:upcase)

  def my_map(operator=nil, &block)
    # Keep the proc Ruby creates if a block is given
    # If no block is given, create a proc manually
    block = block || Proc.new { |o| o.send(operator) }

    # loop through array & call the proc on each element
    result = []
    self.each do |element|
      result.push block.call(element)
    end
    result
  end


  # reduce, inject
  # ********************************************************
  # we want to be able to call it 3 ways
  # Way #1:  [1,2,3,4,5].my_reduce(100,:+)
  # Way #2  [1,2,3,4,5].my_reduce { |sum, n| sum + n }
  # Way #3  [1,2,3,4,5].my_reduce(100) { |sum, n| sum + n }

  def my_reduce(acc=0, operator=nil, &block)
    # Keep the proc Ruby creates if a block is given
    # If no block is given, create a proc manually
    block = block || Proc.new { |acc, value| acc.send(operator, value) }

    self.each do |value|
      acc = block.call(acc, value )
    end
    acc
  end


  # select, find_all
  # ********************************************************
  # call it 3 ways
  # Way #1 [1,2,3,4,5].my_select(:even?)
  # Way #1 [1,2,3,4,5].my_select(&:even?)
  # Way #1 [1,2,3,4,5].my_select { |x| x.even? }

  def my_select(operator = nil, &block)
    # Keep the proc Ruby creates if a block is given
    # If no block is given, create a proc manually
    block = block || Proc.new { |value| value.send(operator) }

    result = []
    self.each do |value|
      result.push value if block.call(value)
    end
    result
  end


  # reject
  # ********************************************************
  # call it 3 ways
  # Way #1 [1,2,3,4,5].my_reject(:even?)
  # Way #1 [1,2,3,4,5].my_reject(&:even?)
  # Way #1 [1,2,3,4,5].my_reject{ |x| x.even? }

  def my_reject(operator = nil, &block)
    # Keep the proc Ruby creates if a block is given
    # If no block is given, create a proc manually
    block = block || Proc.new { |value| value.send(operator) }

    result = []
    self.each do |value|
      result.push value unless block.call(value)
    end
    result
  end


  # all
  # ********************************************************
  # call it 1 way
  # Way #1 [1,2,3,4,5].my_all { |x| x > 3 }

  def my_all?(&block)
    result = 0
    self.each do |value|
      result += 1 if block.call(value)
    end

    result == self.length
  end


  # any
  # ********************************************************
  # call it 1 way
  # Way #1 [1,2,3,4,5].my_any { |x| x > 3 }

  def my_any?(&block)
    result = 0
    self.each do |value|
      result += 1 if block.call(value)
    end

    result > 0
  end

  # count
  # ********************************************************
  # call it 3 ways
  # Way #1 [1,2,3,4,5].my_count
  # Way #2 [1,2,3,4,5].my_count(5)  #=> 1
  # Way #3 [1,2,3,4,5].my_count { |x| x % 2 == 0 }  #=> 2

  # This method doesn't work for parameters nil and false
  def my_count(match=nil, &block)
    # Keep the proc Ruby creates if a block is given
    # If no block is given, create a proc manually
    block = block || Proc.new { |value| value.object_id }

    result = 0

    unless match
      self.each do |value|
        result += 1 if block.call(value)
      end
    end

    if match
      self.each do |value|
        result += 1 if value.equal?(match)
      end
    end

    result
  end

  # detect, find
  # ********************************************************
  # call it 1 way
  # Way #1 [1,2,3,4,5].my_detect { |x| x%5==0 }
  def my_detect(&block)
    counter, found = 0, false
    self.each do |value|
      if block.call(value)
        return self[counter]
      else
        counter +=1
      end
    end
    nil
  end

  # drop
  # ********************************************************
  # call it 1 way
  # Way #1 [1,2,3,4,5].my_drop(n)

  def my_drop(cutoff)
    result = []
    i = 0
    each do | value |
      result.push value  if i >= cutoff
      i += 1
    end
    result
  end


  # drop_while
  # ********************************************************
  # call it 1 way
  # Way #1 [1,2,3,4,5].my_while_drop { |x| x < 3 }

  def my_drop_while(&block)
    counter = 0
    each do | value |
      if block.call(value)
        counter +=1
      elsif
        nil
        break
      end
    end
    last_index = length - 1
    remaining_elements = last_index - counter + 1
    slice(counter,remaining_elements)
  end
end

Array.include MyEnumerable


