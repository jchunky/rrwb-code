module Values
  extend self

  NUMBER_OF_TOSSES = 1000

  def values
    NUMBER_OF_TOSSES.times.each_with_object([0]) do |_, acc|
      acc << acc[-1] + toss
    end
  end

  def toss
    [-2, 2].sample
  end
end
