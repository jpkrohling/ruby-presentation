## everything, absolutely everything in ruby is an object...
# this whole file, in fact, is an object: at first, the ruby intepreter wraps it all into a class, then runs it

## self == this (sort of)
puts self.class

## even literals are objects
puts 1.class
puts /some regex inside/.class
puts 1.2r.class
puts 1.1.class
puts ''.class

## and obviously, Fixnums have methods. No auto boxing nor unboxing needed.
puts
10.times do | y |
  puts "#{y} and then some"
end

## blocks are also classes, wrapped into a class of name 'Proc'
puts
class Example
  def receives_block(&block)
    puts block.class
  end
end

Example.new.receives_block do
  'this will never be executed'
end

## similar with lambdas
class Example
  def receives_lambda(lambda)
    puts lambda.class
  end
end

Example.new.receives_lambda -> {'this will never be executed'}
