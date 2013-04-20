require "open3"

class Rbsh::Pipeline < BasicObject
  attr_writer :_queue

  def to_ary
    commands = _queue.map do |c|
      [ c[:command], *c[:args] ].compact.map(&:to_s)
    end

    result = []
    ::Open3.pipeline_rw(*commands) do |stdin, stdout, wait_threads|
      stdin.close
      result = stdout.readlines
    end
    result << "\n" if result == []
    result
  end

  def to_s
    result = to_ary
    result.join("")
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
