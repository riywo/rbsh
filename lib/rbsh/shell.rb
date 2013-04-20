require "open3"

class Rbsh::Shell < BasicObject
  attr_writer :_queue

  def load_script!(script)
    instance_eval(script)
  end

  def to_s
    commands = _queue.map do |c|
      [ c[:command], *c[:args] ].compact.map(&:to_s)
    end

    result = nil
    ::Open3.pipeline_rw(*commands) do |stdin, stdout, wait_threads|
      stdin.close
      result = stdout.read
    end
    result += "\n" if result == ""
    result
  end
  alias inspect to_s

  def method_missing(name, *args, &block)
    _push(name, *args)
    self
  end

  protected

  def _push(name, *args, &block)
    _queue.push(command: name, args: args)
  end

  def _queue
    @_queue ||= []
  end
end
