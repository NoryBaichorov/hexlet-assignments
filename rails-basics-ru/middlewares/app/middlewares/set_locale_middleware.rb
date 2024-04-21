# frozen_string_literal: true

class SetLocaleMiddleware
  attr_reader :app

  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    @status, @headers, @response = app.call(env)

    @headers['HTTP_ACCEPT_LANGUAGE'] = I18n.locale

    pp "*** FROM MIDDLEWARE -> #{@headers['HTTP_ACCEPT_LANGUAGE']} ***"
    
    [@status, @headers, @response]
  end
  # END
end
