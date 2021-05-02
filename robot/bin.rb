class Bin
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def to_s
    " bin=#{id}"
  end

  def ==(other)
    id == other.id
  end
end

NO_BIN = Bin.new("")
def NO_BIN.to_s
  ""
end
