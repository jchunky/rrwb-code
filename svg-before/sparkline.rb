require_relative "svg"

class Sparkline < Struct.new(:y_values)
  def to_svg
    Svg.define { [x_axis, sparkline, spark] }
  end

  private

  def x_axis
    Svg.line(0, 0, y_values.size, 0)
  end

  def sparkline
    Svg.polyline(y_values)
  end

  def spark
    [
      Svg.rect(last_x, last_y),
      Svg.text(last_x + 6, last_y - 4, last_y),
    ]
  end

  def last_x
    y_values.size - 1
  end

  def last_y
    y_values.last
  end
end
