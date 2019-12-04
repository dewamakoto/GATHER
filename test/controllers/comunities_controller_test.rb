require 'test_helper'

class ComunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comunities_index_url
    assert_response :success
  end

  test "should get show" do
    get comunities_show_url
    assert_response :success
  end

  test "should get new" do
    get comunities_new_url
    assert_response :success
  end

end
