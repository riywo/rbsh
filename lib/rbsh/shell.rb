require "open3"

class Rbsh::Shell < BasicObject
  attr_writer :_queue
  attr_accessor :_result

  def run!
    @_result = [] unless @_result
    _queue.each do |pipeline|
      @_result += pipeline.to_ary
    end
    to_s
  end

  def to_ary
    _result
  end

  def to_s
    to_ary.join("")
  end
  alias inspect to_s

  def method_missing(name, *args, &block)
    pipeline = ::Rbsh::Pipeline.new(name, *args)
    _queue.push(pipeline)
    pipeline
  end

  def load_script!(script)
    instance_eval(script)
  end

  protected

  def _queue
    @_queue ||= []
  end

  def _result
    @_result ||= []
  end
end
