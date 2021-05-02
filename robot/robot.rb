require_relative "bin"

class Robot
  attr_reader :location, :bin

  def initialize
    @bin = nil
  end

  def move_to(location)
    @location = location
  end

  def pick
    @bin = @location.take
  end

  def release
    @location.put(@bin)
    @bin = nil
  end

  def to_s
    [
      "Robot",
      location && " location=#{location.name}",
      Bin.build(@bin),
    ].join
  end
end
