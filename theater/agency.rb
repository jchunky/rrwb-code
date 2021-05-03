class Agency
  def self.book(num_reqd, theater)
    theater.free_seats.first(num_reqd)
  end
end
