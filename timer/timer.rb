module Timer
  def times(env)
    interval = integer(env, "interval")
    duration = multiple_of(env, "duration", interval)
    departure = multiple_of(env, "departure", interval)

    [interval, duration, departure]
  end

  private

  def multiple_of(env, attribute, interval)
    result = integer(env, attribute)
    raise "#{attribute} should be multiple of interval" if (result % interval) != 0

    result
  end

  def integer(env, attribute)
    result = env[attribute]
    raise "#{attribute} missing" if result.nil?

    result = Integer(result)
    raise "#{attribute} should be > 0" if result <= 0

    result
  end
end
