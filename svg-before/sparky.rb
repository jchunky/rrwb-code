require_relative "data_generator"
require_relative "sparkline"

data = DataGenerator.values
puts Sparkline.make(data)
