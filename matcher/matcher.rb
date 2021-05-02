module Matcher
  extend self

  def match(expected, actual, clip_limit, delta)
    actual = clip(actual, clip_limit)

    actual.size == expected.size &&
      similar_values?(expected, actual, delta)
  end

  private

  def clip(values, clip_limit)
    values.map { |val| [val, clip_limit].min }
  end

  def similar_values?(values1, values2, delta)
    values1.zip(values2).all? { |v1, v2| (v1 - v2).abs <= delta }
  end
end
