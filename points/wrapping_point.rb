require "active_support/all"
require_relative "point"

class WrappingPoint
  attr_reader :point, :max

  delegate :x, :y, to: :point

  def initialize(point, max)
    @point = point % max
    @max = max
  end

  def move_to(point)
    build(point)
  end

  def move_by(other)
    build(point + other)
  end

  def build(point)
    self.class.new(point, max)
  end
end
