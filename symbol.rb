# A symbol is a "name": it's basically an immutable string, used mostly for naming things:

# method names, for instance, are internally stored as symbols:
class Example
end

Example.new.methods.each do | method |
  puts "The method name #{method} is stored as a symbol" if method.is_a? Symbol
end

# as it's immutable, they are good candidates for hash keys:
puts
var = {aa: 'Value', ab:'Another value'}
var.each_key do | key |
  puts "They key #{key} is a symbol" if key.is_a? Symbol
end

# btw, those are the same when assigning values: the first is "old" syntax, the second is the "new" syntax
var = { aa: 'Value', ab: 'Another value' }
var = { :aa => 'Value', :ab => 'Another value'}

# they are also good candidates for named parameters:
class Example
  def sample(a: nil, b: 'Default')
    "I've got 'a' as #{a.nil? ? 'nil' : a} and b as #{b}"
  end
end

puts
ex = Example.new
puts ex.sample
puts ex.sample(b:'Some value')
puts ex.sample(a:'Some value')
puts ex.sample(b: 'Something else', a:'Some value')
puts ex.sample(a: 'Something else', b:'Some value')

## talking about hashes/named parameters, we can do this:
class Example
  def sample(**values)
    "I've got 'a' as #{values[:a].nil? ? 'nil' : values[:a]} and b as #{values[:b]}"
  end
end

puts
ex = Example.new
puts ex.sample
puts ex.sample(b:'Some value')
puts ex.sample(a:'Some value')
puts ex.sample(b: 'Something else', a:'Some value')
puts ex.sample(a: 'Something else', b:'Some value')
