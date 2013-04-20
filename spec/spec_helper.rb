require 'rspec'
require 'rbsh'
require 'rbsh/cli'
require 'tapp'

def capture_stdout
  old_stdout = $stdout.dup
  rd, wr = IO.method(:pipe).arity.zero? ? IO.pipe : IO.pipe("BINARY")
  $stdout = wr
  yield
  wr.close
  rd.read
ensure
  $stdout = old_stdout
end

def rbsh(args)
  capture_stdout do
    begin
      Rbsh::CLI.start(args.split(" "))
    rescue SystemExit
    end
  end
end
