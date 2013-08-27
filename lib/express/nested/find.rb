class Express
  def find(value = nil, &block)
    value ? add_value(Nested::Find, value) : add_nested(Nested::Find, &block)
  end
  alias_method :capture, :find

  module Nested
    class Find
      include Nested

      def initialize(value = nil, &block)
        @expression = value || Express.new.instance_eval(&block)
        @open, @close = "(", ")"
      end
    end
  end
end
