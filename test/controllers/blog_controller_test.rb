require 'test_helper'

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "shoul get root" do
    get root_url
    assert_response :success
    assert_select "title","Blog"
  end
end
