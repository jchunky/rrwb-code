require_relative "wrapping_point"
require "active_support/all"

class Button
  attr_reader :name, :max, :location

  delegate :x, :y, to: :location

  def initialize(name, max_x, max_y)
    @location = WrappingPoint.for(0, 0, max_x, max_y)
    @name = name
  end

  def move_to(x, y)
    point = Point.new(x, y)
    @location = @location.move_to(point)
  end
end
