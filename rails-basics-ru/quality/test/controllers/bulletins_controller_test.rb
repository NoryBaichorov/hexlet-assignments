# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins page' do
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'shows one bulletin page' do
    get bulletin_path(bulletins(:bulletin1))

    assert_response :success
    assert_select 'h1', 'Title 1'
    assert_select 'p', 'Body 1'
  end
end
