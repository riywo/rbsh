require "open3"

class Rbsh::Pipeline < BasicObject
  attr_writer :_queue

  def initialize(name, *args, &block)
    _push(name, *args)
  end

  def run!
    commands = _queue.map do |c|
      [ c[:command], *c[:args] ].compact.map(&:to_s)
    end

    result = Result.new
    ::Open3.pipeline_rw(*commands) do |stdin, stdout, wait_threads|
      stdin.close
      lines = stdout.readlines
      lines = ["\n"] if lines.size == 0
      result.set(lines)
    end
    result
  end

  def method_missing(name, *args, &block)
    _push(name, *args)
    self
  end

  class Result
    def set(lines)
      @lines = lines
    end

    def to_ary
      @lines
    end

    def to_s
      @lines.join("")
    end
    alias inspect to_s
  end

  protected

  def _push(name, *args, &block)
    _queue.push(command: name, args: args)
  end

  def _queue
    @_queue ||= []
  end
end
