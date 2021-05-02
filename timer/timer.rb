module Timer
  def times(env)
    check_interval = integer(env, "interval")
    monitor_time = integer_multiple_of(env, "duration", check_interval)
    departure_offset = integer_multiple_of(env, "departure", check_interval)

    [check_interval, monitor_time, departure_offset]
  end

  private

  def integer_multiple_of(env, name, factor)
    value = integer(env, name)
    raise "#{name} should be multiple of interval" unless (value % factor).zero?

    value
  end

  def integer(env, name)
    value_s = env[name]
    raise "#{name} missing" unless value_s

    value = Integer(value_s)
    raise "#{name} should be > 0" unless value.positive?

    value
  end
end
