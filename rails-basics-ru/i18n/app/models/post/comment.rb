# frozen_string_literal: true

# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post
  class Comment < ApplicationRecord
    belongs_to :post

    validates :body, presence: true
  end
end
