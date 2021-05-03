module Svg
  extend self

  CENTER_Y = 200

  def define
    <<~SVG
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        #{yield.join("\n")}
      </svg>
    SVG
  end

  def polyline(data)
    %(<polyline points="#{points(data).join(' ')}" fill="none" stroke="#333" stroke-width="1" />)
  end

  def line(x1:, y1:, x2:, y2:)
    %(<line x1="#{x1}" y1="#{y_value(y1)}" x2="#{x2}" y2="#{y_value(y2)}" stroke="#999" stroke-width="1" />)
  end

  def rect(x:, y:, width:, height:)
    %(<rect x="#{x}" y="#{y_value(y)}" width="#{width}" height="#{height}" fill="red" stroke="none" stroke-width="0" />)
  end

  def text(x:, y:, message:)
    %(<text x="#{x}" y="#{y_value(y)}" font-family="Verdana" font-size="9" fill="red">#{message}</text>)
  end

  private

  def points(data)
    data.map.with_index { |y, x| [x, y_value(y)].join(",") }
  end

  def y_value(y)
    CENTER_Y - y
  end
end
