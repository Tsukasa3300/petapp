require "test_helper"

class StatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get statuses_show_url
    assert_response :success
  end
end
