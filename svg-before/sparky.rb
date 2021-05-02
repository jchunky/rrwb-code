class Point < Struct.new(:x, :y)
  def to_s
    [x, y].join(",")
  end
end

module DataGenerator
  extend self

  NUMBER_OF_TOSSES = 1000

  def points
    values.map.with_index { |value, i| Point.new(i, value) }
  end

  private

  def values
    NUMBER_OF_TOSSES.times.each_with_object([0]) do |_, acc|
      acc << acc.last + toss
    end
  end

  def toss
    [-1, 1].sample
  end
end

module Sparkline
  extend self

  def render_svg(points)
    Svg.render do |svg|
      [
        svg.line(x1: 0, y1: 0, x2: points.size, y2: 0),
        svg.sparkline(points),
        svg.spark(x: points.size - 1, y: points.last.y, value: points.last.y),
      ]
    end
  end
end

module Svg
  extend self

  Y_OFFSET = 200

  def render
    %(
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" >
        #{yield(self).join}
      </svg>
    )
  end

  def line(x1:, y1:, x2:, y2:)
    %(<line x1="#{x1}" y1="#{normalize_y(y1)}" x2="#{x2}" y2="#{normalize_y(y2)}" stroke="#999" stroke-width="1" />)
  end

  def sparkline(points)
    %(<polyline points="#{normalize(points).join(' ')}" fill="none" stroke="#333" stroke-width="1" />)
  end

  def spark(x:, y:, value:)
    %(
      <rect x="#{x - 2}" y="#{normalize_y(y) - 2}" width="4" height="4" fill="red" stroke="none" stroke-width="0" />
      <text x="#{x + 6}" y="#{normalize_y(y) + 4}" font-family="Verdana" font-size="9" fill="red" >
        #{value}
      </text>
    )
  end

  private

  def normalize(points)
    points.map { |point| Point.new(point.x, normalize_y(point.y)) }
  end

  def normalize_y(y)
    Y_OFFSET - y
  end
end

points = DataGenerator.points
puts Sparkline.render_svg(points)
