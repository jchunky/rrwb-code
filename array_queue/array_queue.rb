class ArrayQueue
  def initialize
    @array = []
  end

  def add_rear(s)
    @array << s
  end

  def remove_front
    @array.delete_at(0)
  end

  def length
    @array.length
  end
end
