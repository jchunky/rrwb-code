class Machine < Struct.new(:name, :location)
  attr_reader :bin

  def take
    result = @bin
    @bin = nil
    result
  end

  def put(bin)
    @bin = bin
  end
end
