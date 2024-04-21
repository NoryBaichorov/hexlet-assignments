# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # around_action :switch_locale

  # def switch_locale(&action)
  #   logger.debug "*** FROM CONTROLLER Accept-Language => #{request.env['HTTP_ACCEPT_LANGUAGE']} ***"
  #   locale = extract_locale_from_accept_language_header
  #   logger.debug "*** FROM CONTROLLER Locale set to => #{locale} ***"
  #   I18n.locale = locale
  #   I18n.with_locale(locale, &action)
  #   logger.debug "*** FROM CONTROLLER I18n.locale => #{I18n.locale} ***"
  # end

  # private

  # def extract_locale_from_accept_language_header
  #   begin
  #     request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  #   rescue
  #     'ru'
  #   end
  # end
end
