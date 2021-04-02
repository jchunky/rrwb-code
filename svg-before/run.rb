require_relative "sparky"

values = Values.values
puts Sparky.new.create_svg(values)
