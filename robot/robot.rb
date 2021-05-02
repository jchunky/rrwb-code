require_relative "bin"

class Robot
  attr_reader :location, :bin

  def initialize
    @bin = NO_BIN
  end

  def move_to(location)
    @location = location
  end

  def pick
    @bin = @location.take
  end

  def release
    @location.put(@bin)
    @bin = NO_BIN
  end

  def to_s
    [
      "Robot",
      location && " location=#{location.name}",
      bin.description,
    ].join
  end
end
