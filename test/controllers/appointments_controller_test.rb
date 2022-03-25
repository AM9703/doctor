require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get appointments_Index_url
    assert_response :success
  end
end
