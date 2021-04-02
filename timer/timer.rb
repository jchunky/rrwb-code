module Timer
  def times(env)
    interval = get_integer(env, "interval")
    duration = get_integer(env, "duration")
    departure = get_integer(env, "departure")
    verify_multiple_of("duration", duration, interval)
    verify_multiple_of("departure", departure, interval)

    [interval, duration, departure]
  end

  private

  def get_integer(env, attr)
    result = env[attr]
    raise "#{attr} missing" unless result

    result = Integer(result)
    raise "#{attr} should be > 0" if result <= 0

    result
  end

  def verify_multiple_of(attr, dividend, divisor)
    raise "#{attr} should be multiple of interval" if (dividend % divisor) != 0
  end
end
