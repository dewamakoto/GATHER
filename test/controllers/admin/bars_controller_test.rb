require 'test_helper'

class Admin::BarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_bars_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bars_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_bars_show_url
    assert_response :success
  end

end
