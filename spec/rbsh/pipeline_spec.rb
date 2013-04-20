describe Rbsh::Pipeline do
  describe "echo test" do
    subject { Rbsh::Pipeline.new(:echo, "test").run! }
    its(:to_s) { should eq "test\n" }
  end

  describe "echo test | grep test" do
    subject { Rbsh::Pipeline.new(:echo, "test").grep("test").run! }
    its(:to_s) { should eq "test\n" }
  end

  describe "echo test | grep no" do
    subject { Rbsh::Pipeline.new(:echo, "test").grep("no").run! }
    its(:to_s) { should eq "\n" }
  end
end
