describe Rbsh::CLI do
  describe "version" do
    it "displays gem version on shortcut command" do
      rbsh("-v").chomp.should == Rbsh::VERSION
    end
  end

  describe %q{rbsh -e 'echo("test")'} do
    subject { rbsh("-e" 'echo("test")') }
    it { should eq "test\n" }
  end

  describe %q{rbsh -e 'echo("test1")\necho("test2")'} do
    subject { rbsh("-e" "echo(\"test1\")\necho(\"test2\")") }
    it { should eq "test1\ntest2\n" }
  end
end
