require "webrat/core/locators/locator"

module Webrat
  module Locators

    class FieldLocator < Locator # :nodoc:

      def locate
        if @value.is_a?(Field)
          @value
        else
          FieldByIdLocator.new(@session, @dom, @value).locate   ||
          FieldNamedLocator.new(@session, @dom, @value, *@field_types).locate   ||
          FieldLabeledLocator.new(@session, @dom, @value, *@field_types).locate
        end
      end

      def error_message
        "Could not find field: #{@value.inspect}"
      end

    end

    def field(*args) # :nodoc:
      FieldLocator.new(@session, dom, *args).locate!
    end

  end
end
