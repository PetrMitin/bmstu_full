require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should not calculate without login" do
    get home_view_url, params: { n: 1, m: 2 }
    assert_redirected_to root_url
  end

end
