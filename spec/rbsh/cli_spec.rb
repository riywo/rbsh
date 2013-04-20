describe Rbsh::CLI do
  describe "version" do
    it "displays gem version" do
      rbsh("version").chomp.should == Rbsh::VERSION
    end

    it "displays gem version on shortcut command" do
      rbsh("-v").chomp.should == Rbsh::VERSION
    end
  end
end
