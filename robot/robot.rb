class Robot
  attr_reader :location, :bin

  def initialize
    @bin = NullBin.new
  end

  def move_to(location)
    @location = location
  end

  def pick
    @bin = @location.take
  end

  def release
    @location.put(@bin)
    @bin = NullBin.new
  end

  def to_s
    [
      "Robot",
      location && " location=#{location.name}",
      bin,
    ].join
  end
end
