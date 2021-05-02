class Machine
  attr_reader :name, :bin

  def initialize(name, location)
    @name = name
    @location = location
    @bin = NullBin.new
  end

  def take
    result = @bin
    @bin = NullBin.new
    result
  end

  def put(bin)
    @bin = bin
  end

  def to_s
    [
      "Machine #{name}",
      bin,
    ].join
  end
end
