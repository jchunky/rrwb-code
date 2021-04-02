class Report
  def self.report(out, machines, robot)
    out.print "FACTORY REPORT\n"
    machines.each do |machine|
      out.print "Machine #{machine.name}"
      out.print " bin=#{machine.bin}" unless machine.bin.nil?
      out.print "\n"
    end
    out.print "\n"
    out.print "Robot"
    out.print " location=#{robot.location.name}" unless robot.location.nil?
    out.print " bin=#{robot.bin}" unless robot.bin.nil?
    out.print "\n"
    out.print "========\n"
  end
end
