require_relative "warehouse"

module Report
  extend self

  def report(out, machines, robot)
    Warehouse.new(machines, robot).report(out)
  end
end
