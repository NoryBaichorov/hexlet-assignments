# frozen_string_literal: true

require "digest"

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    body.push Digest::SHA256.hexdigest(body[0])

    [status, headers, body]
  end
end
