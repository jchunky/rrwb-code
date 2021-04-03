require_relative "point"
require "active_support/all"

class Button
  attr_reader :name, :max, :location

  delegate :x, :y, to: :location

  def initialize(name, max_x, max_y)
    @name = name
    @max = Point.new(max_x, max_y)
    @location = Point.new(0, 0)
  end

  def move_to(x, y)
    @location = Point.new(x, y) % max
  end
end
