class CheckpointObject
  attr_reader :state

  def initialize(obj)
    @state = var_values(obj)
  end

  def changes(other)
    other.state.reject { |k, v| state[k] == v }
  end

  private

  def var_values(obj)
    obj
      .instance_variables
      .map { |var| [var.to_s, obj.instance_variable_get(var)] }
      .to_h
      .except("@state")
  end
end

module Checkpoint
  def checkpoint
    @state = make_checkpoint
  end

  def changes
    @state.changes(make_checkpoint)
  end

  private

  def make_checkpoint
    CheckpointObject.new(self)
  end
end

class Object
  include Checkpoint
end
