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
    @bin = bin
  end

  def to_s
    [
      "Machine #{name}",
      bin,
    ].join
  end

  def location_string
    " location=#{name}"
  end
end

NO_LOCATION = Machine.new("", "")
def NO_LOCATION.location_string
  ""
end
