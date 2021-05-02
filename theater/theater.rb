class Theater < Struct.new(:seats)
  def free_seats
    seats.chars.each.with_index.with_object([]) do |(item, index), acc|
      acc << index if item == "-"
    end
  end
end
