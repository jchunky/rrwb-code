class Machine
  attr_reader :name, :bin

  def initialize(name, location)
    @name = name
    @location = location
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
      bin && " bin=#{bin}",
    ].join
  end
end
