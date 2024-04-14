# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post

  validates :title, presence: true
end
