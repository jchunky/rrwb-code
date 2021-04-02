require_relative "svg"

class Sparky
  include Svg

  def create_svg(values)
    last_value = values[-1]
    last_x = values.size - 1
    last_y = last_value

    svg do
      %(
        #{line(0, 0, values.size, 0)}
        #{polyline(values)}
        #{rect(last_x, last_y)}
        #{text(last_x + 6, last_y - 4, last_value)}
      )
    end
  end
end
