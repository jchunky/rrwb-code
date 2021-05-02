require_relative "bin"
require_relative "machine"
require_relative "robot"

describe Robot, "when new" do
  before :each do
    @robot = Robot.new
  end

  it "has no location yet" do
    @robot.location.should == NO_LOCATION
  end

  it "does not point at a bin yet" do
    @robot.bin.should == NO_BIN
  end
end

describe Robot, "in a world with machines" do
  before :each do
    @robot = Robot.new
    @sorter = Machine.new("Sorter", "left")
    @sorter.put(Bin.new("chips"))
    @oven = Machine.new("Oven", "middle")
  end

  describe "moving among machines" do
    it "reports correct location" do
      @robot.move_to(@oven)
      @robot.location.should == @oven
    end
  end

  describe "moving and picking" do
    it "should take the bin away from the machine" do
      lambda {
        @robot.move_to(@sorter)
        @robot.pick
      }.should change { @sorter.bin }.from(Bin.new("chips")).to(NO_BIN)
    end
  end

  describe "picking and releasing" do
    def move_and_pick_and_move_and_release
      @robot.move_to(@sorter)
      @robot.pick
      @robot.move_to(@oven)
      @robot.release
    end

    it "should take the bin away from the sorter" do
      lambda {
        move_and_pick_and_move_and_release
      }.should change { @sorter.bin }.from(Bin.new("chips")).to(NO_BIN)
    end

    it "should deposit the bin at the oven" do
      lambda {
        move_and_pick_and_move_and_release
      }.should change { @oven.bin }.from(NO_BIN).to(Bin.new("chips"))
    end
  end
end
