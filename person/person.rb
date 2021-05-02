class Person < Struct.new(:last, :first, :middle)
  def full_name
    [first, middle, last].compact.join(" ")
  end

  def citation_name
    ["#{last},", first, middle].compact.join(" ")
  end
end
