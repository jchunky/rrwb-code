class SimpleQueue
  attr_reader :elements

  delegate :clear, :first, :length, to: :elements

  def initialize
    @elements = []
  end

  def remove_front
    elements.shift
  end

  def add_rear(element)
    elements.push(element)
  end
end
