## In Ruby, there's no "method call": everything is "message passing"

var = 'abcde'
puts var.reverse
print var.send(:reverse)
puts

class Example
  def existing_method
    # the last line of a method is its result:
    # so, the line below is similar to " return 'This method exists!' "
    'This method exists!'
  end

  def find_by_something(something)
    "My specialized lookup of something: #{something}"
  end

  def method_missing(name, *args)
    if name =~ /^find_by_/
      column = name.to_s.sub('find_by_', '')
      return "Would look for value #{args[0]} in column #{column}"
    end

    "The method #{name} doesn't exist."
  end
end

puts
ex = Example.new
puts ex.existing_method
puts ex.non_existing_method

puts
id = 123
name = 'jdoe'
puts ex.find_by_id(id)
puts ex.find_by_name(name)
puts ex.find_by_something('something!')

puts
puts ex.respond_to? :find_by_something
puts ex.respond_to? :find_by_id