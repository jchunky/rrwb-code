class Bin
  def initialize(id)
    @id = id
  end

  def to_s
    @id
  end

  def ==(other)
    to_s == other.to_s
  end

  def description
    " bin=#{@id}"
  end

  def nil?
    "".empty?
  end
end

class String
  def ==(other)
    to_s == other.to_s
  end
end

class NilClass
  def ==(other)
    other == NO_BIN || super(other)
  end
end

NO_BIN = Bin.new("")
def NO_BIN.description
  ""
end
