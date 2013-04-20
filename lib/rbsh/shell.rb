require "open3"

class Rbsh::Shell < BasicObject
  def initialize
    @_result = Result.new
  end

  def run!
    @_result.append(@_pipeline.run!)
    @_result
  end

  def method_missing(name, *args, &block)
    if @_pipeline
      @_result.append(@_pipeline.run!)
    end
    @_pipeline = ::Rbsh::Pipeline.new(name, *args)
    @_pipeline
  end

  def load_script!(script)
    instance_eval(script)
    self
  end

  class Result
    def initialize
      @lines = []
    end

    def append(lines)
      @lines += lines.to_ary
    end

    def to_ary
      @lines
    end

    def to_s
      @lines.join("")
    end
    alias inspect to_s
  end
end
