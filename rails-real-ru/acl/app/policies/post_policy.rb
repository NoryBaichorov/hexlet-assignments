# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  attr_reader :user, :post
  # BEGIN
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    post.author_id == user&.id || user&.admin?
  end

  def update?
    post.author_id == user&.id || user&.admin?
  end

  def destroy?
    user&.admin?
  end
  # END
end
