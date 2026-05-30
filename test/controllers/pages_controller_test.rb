require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get registro" do
    get pages_registro_url
    assert_response :success
  end
end
