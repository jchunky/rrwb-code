require_relative "bin"
require_relative "null_bin"
require_relative "machine"

describe Machine do
  before :each do
    @machine = Machine.new("Oven", "middle")
  end

  it "should initially have no bin" do
    @machine.bin.should == NO_BIN
  end

  it "should accept things into its bin" do
    @machine.put(Bin.new("chips"))
    @machine.bin.should == Bin.new("chips")
  end
end
