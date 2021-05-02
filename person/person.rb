class Person < Struct.new(:last, :first, :middle)
  def full_name
    [first, middle, last].compact.join(" ")
  end

  def full_name_variant
    ["#{last},", first, middle].compact.join(" ")
  end
end
