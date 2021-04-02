class Robot
  attr_reader :location, :bin

  def move_to(location)
    @location = location
  end

  def pick
    @bin = location.take
  end

  def release
    location.put(bin)
    @bin = nil
  end

  def to_s
    [
      "Robot",
      ("location=#{location.name}" unless location.nil?),
      ("bin=#{bin}" unless bin.nil?),
    ].compact.join(" ")
  end
end
