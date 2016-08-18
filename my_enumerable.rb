# Todd Schwartzfarb

# Rewrite the Enumerable Module
# or at least a bunch of its methods
# as a coding exercise
# Inspired by this post:
# https://blog.codeship.com/the-enumerable-module/


module MyEnumerable

  # RECREATE THE MAP METHOD aka COLLECT

  # we want to be able to call it 3 ways
  # Way #1: ['a','b','c'].my_map(:upcase)
  # Way #2: ['a','b','c'].my_map { |i| i.upcase }
  # Way #3: ['a','b','c'].my_map(&:upcase)

  def my_map(operator, &block)
    # Keep the proc Ruby creates if a block is given
    # If no block is given, create a proc manually
    prok = block || Proc.new { |o| o.send(operator) }

    # loop through array & call the proc on each element
    result = []
    self.each do |element|
      result.push prok.call(element)
    end
  end
end




