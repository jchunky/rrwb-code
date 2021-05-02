class Matcher
  def match(expected, actual, clip_limit, delta)
    actual = apply_clip_limit(actual, clip_limit)
    return false unless actual.size == expected.size
    return false unless values_within_delta?(expected, actual, delta)

    true
  end

  private

  def apply_clip_limit(values, clip_limit)
    values.map { |val| [val, clip_limit].min }
  end

  def values_within_delta?(values1, values2, delta)
    values1.zip(values2).all? { |v1, v2| (v1 - v2).abs <= delta }
  end
end
