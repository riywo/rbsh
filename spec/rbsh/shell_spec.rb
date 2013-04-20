describe Rbsh::Shell do
  before :each do
    @shell = Rbsh::Shell.new
  end

  describe "echo test" do
    subject { @shell.echo("test").to_s }
    it { should eq "test\n" }
  end

  describe "echo test | grep test" do
    subject { @shell.echo("test").grep("test").to_s }
    it { should eq "test\n" }
  end

  describe "echo test | grep no" do
    subject { @shell.echo("test").grep("no").to_s }
    it { should eq "\n" }
  end
end
