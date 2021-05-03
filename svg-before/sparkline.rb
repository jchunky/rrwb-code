require_relative "svg"

module Sparkline
  extend self

  def make(data)
    Svg.define do
      [
        x_axis(data.size),
        sparkline(data),
        spark(x: data.size - 1, y: data.last, value: data.last),
      ]
    end
  end

  private

  def x_axis(length)
    Svg.line(x1: 0, y1: 0, x2: length, y2: 0)
  end

  def sparkline(data)
    Svg.polyline(data)
  end

  def spark(x:, y:, value:)
    [
      spark_square(x, y),
      spark_value(x, y, value),
    ]
  end

  def spark_square(x, y)
    Svg.rect(x: x - 2, y: y + 2, width: 4, height: 4)
  end

  def spark_value(x, y, value)
    Svg.text(x: x + 6, y: y - 4, message: value)
  end
end
