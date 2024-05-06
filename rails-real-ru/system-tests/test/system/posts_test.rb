# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = Post.first
  end

  test 'visiting posts path' do
    visit posts_url

    assert_selector 'h1', text: 'Posts'
  end

  test 'should create post' do
    visit posts_url

    click_on 'New Post'

    fill_in 'Title', with: 'Article 1'
    fill_in 'Body', with: 'Body 1'

    click_on 'Create Post'

    assert_text I18n.t('posts.create.success')
  end

  test 'should update post' do
    visit edit_post_path(@post)
    
    fill_in 'Title', with: 'Updated Post'
    fill_in 'Body', with: 'Updated Body'
    
    click_on 'Update Post'
    
    assert_text I18n.t('posts.update.success')
  end

  test 'should destroy post' do
    visit posts_path

    accept_alert 'Are you sure?' do
      first('.link-danger').click
    end

    assert_text I18n.t('posts.destroy.success')
  end
end
# END
