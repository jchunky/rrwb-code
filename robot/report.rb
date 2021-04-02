class Report
  def self.report(out, machines, robot)
    out.print(lines(machines, robot))
  end

  private

  def self.lines(machines, robot)
    [
      "FACTORY REPORT",
      machines.map(&:to_s),
      "",
      robot.to_s,
      "========\n",
    ].flatten.join("\n")
  end
end
