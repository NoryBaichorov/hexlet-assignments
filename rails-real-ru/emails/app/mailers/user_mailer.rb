# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation
    # BEGIN
    @user = params[:user]
    @url = "http://hexlet.test/user/confirm?confirmation_token=#{@user.confirmation_token}"

    mail(to: @user.email, subject: t('user_mailer.account_activation.subject'))
    # END
  end
end
