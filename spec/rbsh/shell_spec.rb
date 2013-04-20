describe Rbsh::Shell do
  before :each do
    @shell = Rbsh::Shell.new
  end

  describe "echo test" do
    before { @shell.echo("test") }
    subject { @shell.run! }
    its(:to_s) { should eq "test\n" }
  end

  describe "echo test | grep test" do
    before { @shell.echo("test").grep("test") }
    subject { @shell.run! }
    its(:to_s) { should eq "test\n" }
  end

  describe "echo test | grep no" do
    before { @shell.echo("test").grep("no") }
    subject { @shell.run! }
    its(:to_s) { should eq "\n" }
  end

  describe "load_script! 'echo(\"test\")'" do
    before { @shell.load_script!('echo("test")') }
    subject { @shell.run! }
    its(:to_s) { should eq "test\n" }
  end

  describe "echo test1; echo test2" do
    before { @shell.echo("test1"); @shell.echo("test2") }
    subject { @shell.run! }
    its(:to_s) { should eq "test1\ntest2\n" }
  end
end
