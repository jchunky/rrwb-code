class Bin
  def self.build(id)
    id ? new(id) : NO_BIN
  end

  def initialize(id)
    @id = id
  end

  def to_s
    " bin=#{@id}"
  end
end

NO_BIN = Bin.new("")
def NO_BIN.to_s
  ""
end
