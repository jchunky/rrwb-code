require_relative "wrapping_point"
require "active_support/all"

class Button
  attr_reader :name, :max, :location

  delegate :x, :y, to: :location

  def initialize(name, max_x, max_y)
    @name = name
    @location = WrappingPoint.new(0, 0, max_x, max_y)
  end

  def move_to(x, y)
    @location = @location.move_to(x, y)
  end
end
