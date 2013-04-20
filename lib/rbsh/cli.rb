require "rbsh"
require "optparse"

class Rbsh::CLI
  def initialize(args=[], config={})
    @config = config
    @args, @opts = parse(args)

    @shell = Rbsh::Shell.new
  end

  def self.start(given_args=ARGV, config={})
    instance = new(given_args, config)
    instance.run
  end

  def run
    if    @opts.has_key? :v
      puts Rbsh::VERSION
    elsif @opts.has_key? :e
      puts @shell.load_script!(@opts[:e]).run!.to_s
    else
      script_file = ARGV[0]
    end
  end

  private

  def parse(args)
    opts = {}
    parser = OptionParser.new
    parser.on("-e 'command'")    { |v| opts[:e] = v }
    parser.on("-v", "--version") { |v| opts[:v] = v }

    parser.parse!(args)
    return args, opts
  end
end
