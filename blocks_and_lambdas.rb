## blocks and lambdas are pretty much the same thing internally
## the difference is in the syntax:

# this is the most basic example: the block gets passed as "implicit" parameter to the method, and passed forward to
# yield, which just executes the block
class Example
  def basic_example
    yield
  end
end

Example.new.basic_example do
  puts 'Just print something'
end

## the block you receive in a method should always be the last parameter (or implicit)
## and you can't receive more than one block... although you can receive multiple lambdas!
puts
class Example
  def receives_parameter_and_implicit_block(parameter)
    puts "Received #{parameter}"
    yield
  end

  def receives_block()
    yield 'a'
  end

  def receives_lambda(lambda)
    lambda.call
    lambda.()
  end

  def do_and_callback(doit, success, failure)
    doit.() ? success.() : failure.()
  end
end

Example.new.receives_parameter_and_implicit_block 'Something' do
  puts 'Sending a block!'
end

Example.new.receives_block do | param |
  puts 'this is a block with this param: ' + param
end

Example.new.receives_lambda -> {
  puts 'this is a lambda'
}

puts
Example.new.do_and_callback -> {puts 'Should do this';false},
                            -> {puts 'Success!'},
                            -> {puts 'Failure :('}