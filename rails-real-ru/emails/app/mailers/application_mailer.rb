# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hexlet-app@example.com'
  layout 'mailer'
end
