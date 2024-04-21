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
    locale = extract_locale(env['HTTP_ACCEPT_LANGUAGE']) || I18n.default_locale
    I18n.locale = locale

    app.call(env)
  end

  private

  def extract_locale(header)
    return if header.nil?

    locale = header.scan(/^[a-z]{2}/).first.to_sym

    I18n.available_locales.include?(locale) ? locale : nil
  end
  # END
end
