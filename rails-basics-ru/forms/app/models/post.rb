# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :summary, presence: true
end
