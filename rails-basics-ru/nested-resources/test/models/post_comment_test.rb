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
require "test_helper"

class PostCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
