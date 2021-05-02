class Warehouse < Struct.new(:machines, :robot)
  def report(out)
    out.print [
      "FACTORY REPORT",
      machines.map do |machine|
        render_machine(machine)
      end,
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
    ].compact.join
  end

  def render_robot(robot)
    [
      "Robot",
      robot.location && " location=#{robot.location.name}",
      robot.bin && " bin=#{robot.bin}",
    ].compact.join
  end
end
