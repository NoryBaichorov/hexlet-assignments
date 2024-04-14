# frozen_string_literal: true

# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PostComment < ApplicationRecord
  belongs_to :post

  validates :comment, presence: true, length: { minimum: 5 }
end
