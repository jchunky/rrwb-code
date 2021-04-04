class WrappingPoint < Struct.new(:x, :y, :max_x, :max_y)
  def initialize(x, y, max_x, max_y)
    super(x % max_x, y % max_y, max_x, max_y)
  end

  def move_to(x, y)
    self.class.new(x, y, max_x, max_y)
  end

  def move_by(other_x, other_y)
    self.class.new(x + other_x, y + other_y, max_x, max_y)
  end
end
