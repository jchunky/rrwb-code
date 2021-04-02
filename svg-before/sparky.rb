module Values
  extend self

  NUMBER_OF_TOSSES = 1000

  def values
    NUMBER_OF_TOSSES.times.each_with_object([0]) do |_, acc|
      acc << acc[-1] + toss
    end
  end

  def toss
    [-2, 2].sample
  end
end

class Sparky
  Y0 = 200

  def create_svg(values)
    points = values.map.with_index { |v, i| "#{i},#{Y0 - v}" }
    last_value = values[-1]
    last_x = values.size - 1
    last_y = Y0 - last_value

    <<~SVG
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" >
        <line x1="0" y1="#{Y0}" x2="#{values.size}" y2="#{Y0}" stroke="#999" stroke-width="1" />
        <polyline fill="none" stroke="#333" stroke-width="1" points="#{points.join(' ')}" />
        <rect x="#{last_x - 2}" y="#{last_y - 2}" width="4" height="4" fill="red" stroke="none" stroke-width="0" />
        <text x="#{last_x + 6}" y="#{last_y + 4}" font-family="Verdana" font-size="9" fill="red" >#{last_value}</text>
      </svg>
    SVG
  end
end
