require "activerecord-attributes/version"
require 'active_support'

module ActiveRecord
  module Attributes

    def attribute(name)
      return unless ActiveRecord::Attributes.with_assertions?
      unless attribute_names.include? name.to_s
        fail AttributeError, "#{self} does not actually have an attribute named #{name}"
      end
    end

    def self.without_assertions
      current = @disable_assertions
      @disable_assertions = true
      yield
    ensure
      @disable_assertions = current
    end

    def self.with_assertions?
      !@disable_assertions
    end

    class AttributeError < StandardError; end
  end

  ActiveSupport.on_load(:active_record) do
    extend Attributes
  end
end
