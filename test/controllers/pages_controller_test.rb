require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get schedule" do
    get pages_schedule_url
    assert_response :success
  end

end
