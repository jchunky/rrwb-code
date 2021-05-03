require "active_support/all"

class ArrayQueue
  attr_reader :array

  delegate :length, to: :array

  def initialize
    @array = []
  end

  def add_rear(s)
    array << s
  end

  def remove_front
    array.shift
  end
end
