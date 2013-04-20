describe Rbsh::Pipeline do
  describe "echo test" do
    subject { Rbsh::Pipeline.new(:echo, "test").to_s }
    it { should eq "test\n" }
  end

  describe "echo test | grep test" do
    subject { Rbsh::Pipeline.new(:echo, "test").grep("test").to_s }
    it { should eq "test\n" }
  end

  describe "echo test | grep no" do
    subject { Rbsh::Pipeline.new(:echo, "test").grep("no").to_s }
    it { should eq "\n" }
  end
end
