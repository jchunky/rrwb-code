require_relative "sparkline"

def toss
  [-1, 1].sample
end

def y_values
  1000.times.each_with_object([0]) do |_, acc|
    acc << acc.last + toss
  end
end

puts Sparkline.new(y_values).to_svg
