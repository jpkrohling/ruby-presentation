class BaseEntity
  attr_accessor :id ## this generates a getter/setter
end

class Persona < BaseEntity ; end

persona = Persona.new
persona.id = 123
puts persona.id

## Of course, you can override the getter/setter, if you want:
puts

class Persona < BaseEntity
  attr_accessor :created_at
  @@factor = 2 ## this is a class variable, ie, static in java

  def initialize
    @created_at = Time.now
  end

  def id=(new_id)
    @id = new_id * @@factor
  end
end
persona = Persona.new
persona.id = 123
puts persona.id
persona.created_at = Time.now
puts persona.created_at


## there are no interfaces or abstract classes in Ruby. But there are mixins
## There are no packages as well, although something very similar exists under the name of "Modules":
puts

module Example
  ## we don't have a BaseEntity defined on this module, so, it looks for a BaseEntity at the system level
  class Persona < BaseEntity

  end

  module InnerModule
    ## class lookup follows the inheritance rules: we don't have a Persona class defined on this module, so, it
    ## looks up for a class on the outer module
    class AnotherPersona < Persona ; end
  end
end

module Example
  module AnotherInnerModule
    class YetAnotherPersona < Persona ; end
  end
end

persona = Example::Persona.new
persona.id = 8789
puts persona.id

persona = Example::InnerModule::AnotherPersona.new
persona.id = 8789
puts persona.id

persona = Example::AnotherInnerModule::YetAnotherPersona.new
persona.id = 8789
puts persona.id
