require "open3"

class Rbsh::Shell < BasicObject
  def method_missing(name, *args, &block)
    ::Rbsh::Pipeline.new(name, *args)
  end

  def load_script!(script)
    instance_eval(script)
  end
end
