class Express
  private

  def add_value(expression, v)
    add(expression.new(v))
  end

  module Value
    def value
      if escapable? then escaped_value else @value end || ""
    end

    private

    def escapable?
      @value.respond_to?(:gsub)
    end

    def escaped_value
      Regexp.escape(@value)
    end
  end
end

require_relative "value/ending"
require_relative "value/except"
require_relative "value/starting"
require_relative "value/with"
