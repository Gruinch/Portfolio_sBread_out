require 'test_helper'

class RelashionshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relashionships_create_url
    assert_response :success
  end

  test "should get index" do
    get relashionships_index_url
    assert_response :success
  end

  test "should get destroy" do
    get relashionships_destroy_url
    assert_response :success
  end

end
