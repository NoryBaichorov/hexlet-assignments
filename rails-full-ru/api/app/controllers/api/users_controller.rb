# frozen_string_literal: true

class Api::UsersController < Api::ApplicationController
  # BEGIN
  def index
    @users = User.all
    respond_with :api, @users
  end

  def show
    @user = User.find(params[:id])
    respond_with :api, @user
  end
  # END
end
