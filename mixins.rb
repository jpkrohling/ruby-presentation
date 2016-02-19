## mixins are like interfaces with default methods

module CustomMixin
  def hello
    'Hello world!'
  end
end

module AnotherMixin
  def hello
    'Heya!'
  end
  def hello2
    'Hello too!'
  end
end

## if we have the same method defined in more than one mixin, the last included one overrides the first
class Example
  include CustomMixin
  include AnotherMixin
end

class Example2
  include AnotherMixin
  include CustomMixin
end
puts Example.new.hello
puts Example2.new.hello

# I can even override system classes for usage within my mixin
puts
module MyExtensions
  refine String do
    def can_say_hello
      'All strings where this is included can say "Hello" '
    end
  end
end

class Example
  using MyExtensions

  def hello
    ''.can_say_hello
  end
end
puts Example.new.hello


## not on topic of mixins, but it's related to the last example:
## In fact, I can even do that to change them in the whole environment (and a lot of libraries do!)
class String
  def can_say_hello
    'All strings IN THE WHOLE WORLD can say "Hello" '
  end

  def to_hawkular_id
    '[~path;to;inventory;item]'
  end
end

puts ''.can_say_hello

## but you can see how it's dangerous, no?
class Fixnum
  def +(*vars)
    42
  end
end

puts
puts 1+3
