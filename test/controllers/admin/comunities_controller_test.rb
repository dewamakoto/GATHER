require 'test_helper'

class Admin::ComunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_comunities_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_comunities_index_url
    assert_response :success
  end

end
