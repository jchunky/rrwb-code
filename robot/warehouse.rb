class Warehouse < Struct.new(:machines, :robot)
  def render_report
    [
      "FACTORY REPORT",
      machines.map(&method(:render_machine)),
      "",
      render_robot(robot),
      "========",
      "",
    ].join("\n")
  end

  private

  def render_machine(machine)
    [
      "Machine #{machine.name}",
      machine.bin && " bin=#{machine.bin}",
    ].join
  end

  def render_robot(robot)
    [
      "Robot",
      robot.location && " location=#{robot.location.name}",
      robot.bin && " bin=#{robot.bin}",
    ].join
  end
end
