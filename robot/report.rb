require_relative "warehouse"

module Report
  extend self

  def report(out, machines, robot)
    out.print Warehouse.new(machines, robot).render_report
  end
end
