## if it walks like a duck and quacks like a duck...

class Duck
  def walk(distance)
    puts "Walking #{distance} duck steps"
  end
end

class Human
  def walk(distance)
    puts "Walking #{distance} meters"
  end
end

class House
end

[Duck, Human, House].each do | clazz |
  var = clazz.new
  print "Trying to walk a #{clazz}: "
  var.respond_to?(:walk) ? var.walk(10) : puts('No, can\'t walk.')
end

class Human
  def walk_to(directions)
    if directions.is_a? String
      puts "Easy, just one step: #{directions}"
    end

    if directions.is_a? Array
      puts 'It\'s not that hard:'
      directions.each do |step|
        puts "- #{step}"
      end
    end
  end
end

puts
var = Human.new
var.walk_to(['Turn right', 'Then turn left', 'Then go straight for about two blocks'])

puts
var = Human.new
var.walk_to('Turn right')


class Test
  def with_array(*arg2, **arg)
    arg[0]
  end
end

Test.new.with_array(a:'a', b:'c', c:'c')