module Svg
  extend self

  def define
    %(
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" >
        #{yield.join("\n")}
      </svg>
    )
  end

  def line(x1, y1, x2, y2)
    %(<line x1="#{x1}" y1="#{y_val(y1)}" x2="#{x2}" y2="#{y_val(y2)}" stroke="#999" stroke-width="1" />)
  end

  def polyline(y_values)
    points = y_values.map.with_index { |v, i| "#{i},#{y_val(v)}" }
    %(<polyline fill="none" stroke="#333" stroke-width="1" points="#{points.join(' ')}" />)
  end

  def rect(x, y)
    %(<rect x="#{x - 2}" y="#{y_val(y) - 2}" width="4" height="4" fill="red" stroke="none" stroke-width="0" />)
  end

  def text(x, y, value)
    %(<text x="#{x}" y="#{y_val(y)}" font-family="Verdana" font-size="9" fill="red" >#{value}</text>)
  end

  private

  def y_val(y)
    200 - y
  end
end
