class VarValues
  attr_reader :values

  def initialize(obj, variables)
    @values = to_values(obj, variables)
  end

  def changes(other)
    other
      .values
      .reject { |k, v| values[k] == v }
  end

  private

  def to_values(obj, variables)
    variables
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
    VarValues.new(self, instance_variables)
  end
end

class Object
  include Checkpoint
end
