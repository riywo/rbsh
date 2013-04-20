require "rbsh"
require "thor"

class Rbsh::CLI < Thor
  def initialize(args=[], options={}, config={})
    super
  end

  desc "version", "Display rbsh version"
  map ["-v", "--version"] => :version
  def version
    puts Rbsh::VERSION
  end
end
