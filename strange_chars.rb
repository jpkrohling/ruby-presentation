## question marks:

## convention: methods ending in question marks return a boolean
var = 'a'.nil? ? 'b' : 'c'
puts var

## convention: methods ending in exclamation marks change the instance itself
puts
var = 'a'
puts var

var2 = var.upcase
puts var

var2 = var.upcase!
puts var

## << == append
puts
var = 'a'
var << 'b'
var += 'c'
var = "#{var}d"
puts var

## || == 'or', can be used for setting values if none is set yet
puts
my_other_var ||= 'a'
my_other_var ||= 'b'
puts my_other_var

