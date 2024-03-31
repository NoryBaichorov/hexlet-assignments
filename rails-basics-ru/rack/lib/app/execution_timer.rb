# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, headers, body = @app.call(env)
    finish = Time.now

    body.push "Execute time -> #{get_execution_time(start, finish)} microseconds"

    [status, headers, body]
  end

  def get_execution_time(start, finish)
    result = (finish - start) * 1000000
    result += finish.usec > start.usec ? finish.usec - start.usec : finish.usec + 1000000 - start.usec
  end
end
