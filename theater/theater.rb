class Theater
  attr_reader :seats

  def initialize(seats)
    @seats = seats.chars
  end

  def free_seats
    seats
      .map.with_index { |item, index| [item, index] }
      .select { |item, _index| item == "-" }
      .map { |_item, index| index }
  end
end
