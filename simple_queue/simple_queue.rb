class SimpleQueue
  attr_reader :elements

  delegate :shift, :push, :clear, :first, :length, to: :elements

  alias remove_front shift
  alias add_rear push

  def initialize
    @elements = []
  end
end
