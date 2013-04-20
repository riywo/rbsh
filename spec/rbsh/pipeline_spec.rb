describe Rbsh::Pipeline do
  before :each do
    @pipeline = Rbsh::Pipeline.new
  end

  describe "echo test" do
    subject { @pipeline.echo("test").to_s }
    it { should eq "test\n" }
  end

  describe "echo test | grep test" do
    subject { @pipeline.echo("test").grep("test").to_s }
    it { should eq "test\n" }
  end

  describe "echo test | grep no" do
    subject { @pipeline.echo("test").grep("no").to_s }
    it { should eq "\n" }
  end
end
