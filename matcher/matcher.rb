class Array
  def clip(clip_limit)
    map { |val| [val, clip_limit].min }
  end

  def similar?(other, delta)
    size == other.size &&
      zip(other).all? { |v1, v2| (v1 - v2).abs <= delta }
  end
end

module Matcher
  extend self

  def match(expected, actual, clip_limit, delta)
    actual.clip(clip_limit).similar?(expected, delta)
  end
end
