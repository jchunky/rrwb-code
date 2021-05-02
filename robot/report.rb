class Report
  def self.report(out, machines, robot)
    out.print [
      "FACTORY REPORT",
      machines,
      "",
      robot,
      "========",
      "",
    ].join("\n")
  end
end
