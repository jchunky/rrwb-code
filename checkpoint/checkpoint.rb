class CheckpointObject
  attr_reader :values

  def initialize(obj)
    @values = values_of(obj)
  end

  def changes(other)
    other.values.reject { |k, v| values[k] == v }
  end

  private

  def values_of(obj)
    obj.instance_variables
      .map { |var| [var.to_s, obj.instance_variable_get(var)] }
      .to_h
      .except("@state")
  end
end

module Checkpoint
  def checkpoint
    @state = var_values
  end

  def changes
    @state.changes(var_values)
  end

  private

  def var_values
    CheckpointObject.new(self)
  end
end

class Object
  include Checkpoint
end
