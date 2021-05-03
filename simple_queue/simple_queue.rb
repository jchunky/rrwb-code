require "active_support/all"

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
    elements << element
  end
end
