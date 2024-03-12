# frozen_string_literal: true
require_relative 'test_helper'
require_relative '../lib/stack'
require 'minitest/power_assert'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @data = Stack.new(%w[php js ruby])
  end

  def test_push!
    elem = 'python'

    expected = @data.size + 1

    @data.push!(elem)

    assert { expected == @data.size }
  end

  def test_pop!
    expected = @data.size - 1

    @data.pop!

    assert { expected == @data.size }
  end

  def test_clear!
    expected = []

    @data.clear!

    assert { expected == @data.to_a }
  end

  def test_empty?
    expected = @data.empty?

    assert { expected == @data.empty?  }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
