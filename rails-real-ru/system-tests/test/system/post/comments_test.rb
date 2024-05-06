# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class CommentsTest < ApplicationSystemTestCase
  setup do
    @post = Post.first
    @comment = @post.comments.first
  end

  test 'should create comment' do
    visit post_url(@post)
    
    fill_in 'post_comment[body]', with: 'New Comment Create'
    
    click_on 'Create Comment'
    
    assert_text I18n.t('posts.comments.create.success')
  end

  test 'should update comment' do
    visit edit_post_comment_path(@post, @comment)
    
    fill_in 'post_comment[body]', with: 'Updated Comment'
    
    click_on 'Update Comment'
    
    assert_text I18n.t('posts.comments.update.success')
  end

  test 'should destroy post' do
    visit post_url(@post)
    take_screenshot
    accept_alert 'Are you sure?' do
      first('.link-danger').click
    end

    assert_text I18n.t('posts.comments.destroy.success')
    take_screenshot
  end
end
# END
