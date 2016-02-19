### Shows particularities about strings

# strings are wrapped in ", ' or <<... ...
# those are the "same"
my_str = 'a'
puts my_str

my_str = "a"
puts my_str

my_str = <<EOF
a
EOF
puts my_str

# not exactly:
puts
name = 'Foo'

hello = 'Hello #{name}'
puts hello

hello = "Hello #{name}"
puts hello

hello = <<EOF
Hello #{name}
EOF
puts hello

# strings can act like arrays:
puts
hello = 'Hello World'
puts hello[0]
puts hello[0, 5] # "substring"

# strings are mutable:
puts
hello = 'Hello World'
puts hello.__id__
puts hello
hello.replace('Hi there')
puts hello.__id__
puts hello

# as strings are mutable and can act like arrays, we can do this:
puts
hello = 'Hello World'
hello['Hello'] = 'Hi!'
puts hello

# but there are also methods that returns a new instance of a string
puts
hello = 'Hello World'
hello.sub('World', 'Earth')
puts hello
hello.sub!('World', 'Earth')
puts hello
