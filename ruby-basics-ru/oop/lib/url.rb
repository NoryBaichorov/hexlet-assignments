# frozen_string_literal: true
require 'forwardable'
require 'uri'

# BEGIN
class Url
  include Comparable
  extend Forwardable

  def_delegators :uri, :scheme, :host, :port
  attr_reader :uri, :params

  def initialize(uri)
    @uri = URI(uri)

    @params = @uri.query.to_s.split('&').each_with_object({}) do |param, acc|
      k, v = param.split('=')

      acc[k.to_sym] = v
    end
  end

  def query_params
    p @params
  end

  def query_param(key, default = nil)
    @params.include?(key) ? @params[key] : default
  end

  def <=>(other)
    [host, scheme, port, params] <=> [other.host, other.scheme, other.port, other.params]
  end
end
# END
