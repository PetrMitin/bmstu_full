require "test_helper"

class CalcControllerTest < ActionDispatch::IntegrationTest
  test "should get view with different parameters" do
    get calc_view_url, params: {n: 12, m: 9}
    assert_response :success

    nok = assigns[:nok]
    nod = assigns[:nod]

    get calc_view_url, params: {n: 100, m: 15}
    assert_response :success

    assert_not_equal nok, assigns[:nok]
    assert_not_equal nod, assigns[:nok]
  end
end
