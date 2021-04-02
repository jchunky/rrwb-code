require_relative "sparky"
require_relative "values"

values = Values.values
puts Sparky.new.create_svg(values)
