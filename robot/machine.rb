require_relative "bin"

class Machine
  attr_reader :name, :bin

  def initialize(name, location)
    @name = name
    @location = location
    @bin = nil
  end

  def take
    result = @bin
    @bin = nil
    result
  end

  def put(bin)
    @bin = bin
  end

  def to_s
    [
      "Machine #{name}",
      Bin.build(@bin),
    ].join
  end
end
