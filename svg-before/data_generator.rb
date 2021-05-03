module DataGenerator
  extend self

  NUMBER_OF_TOSSES = 1000

  def values
    NUMBER_OF_TOSSES.times.each_with_object([0]) do |_, acc|
      acc << acc.last + toss
    end
  end

  private

  def toss
    [-1, 1].sample
  end
end
