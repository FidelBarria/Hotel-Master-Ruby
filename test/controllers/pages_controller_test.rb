require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get reception" do
    get pages_reception_url
    assert_response :success
  end
end
