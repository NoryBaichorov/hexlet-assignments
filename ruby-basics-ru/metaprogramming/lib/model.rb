# frozen_string_literal: true

# BEGIN
require 'date'

module Model
  module ClassMethods
    def attribute(name, *options)

      define_method "#{name}" do
        value = instance_variable_get "@#{name}"
        return nil if value.nil?

        case options.first[:type]
        when :integer then value.to_i
        when :string then value.to_s
        when :datetime then DateTime.parse(value)
        when :boolean then !!value
        else value
        end
      end

      define_method "#{name}=" do |value|
        instance_variable_set "@#{name}", value
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(attributes = {})
    attributes.keys.each do |k|
      instance_variable_set "@#{k}", attributes[k]
    end
  end

  def attributes
    instance_variables.reduce({}) do |acc, var|
      var = var[1..]
      acc[var.to_sym] = send(var)
      acc
    end
  end
end

# END