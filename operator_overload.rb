## we've seen this hinted earlier, but in Ruby, it's possible to define/overload operators:

# here, we are defining some
class Example
  def +(*args)
    'nah'
  end

  def <<(*args)
    'would append'
  end
end

example = Example.new
puts example + 'aaa'
puts example << 'aaa'

puts 'abc' + 'def'
puts 'abc'.+('def')
