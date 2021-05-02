require_relative "bin"

class Machine
  attr_reader :name, :bin

  def initialize(name, location)
    @name = name
    @location = location
    @bin = NO_BIN
  end

  def take
    result = @bin
    @bin = NO_BIN
    result
  end

  def put(bin)
    @bin = Bin.new(bin.to_s)
  end

  def to_s
    [
      "Machine #{name}",
      bin.description,
    ].join
  end
end
