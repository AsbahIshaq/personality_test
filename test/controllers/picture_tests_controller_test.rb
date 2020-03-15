require 'test_helper'

class PictureTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @picture_test = picture_tests(:one)
  end

  test "should get index" do
    get picture_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_picture_test_url
    assert_response :success
  end

  test "should create picture_test" do
    assert_difference('PictureTest.count') do
      post picture_tests_url, params: { picture_test: { image_url: @picture_test.image_url, title: @picture_test.title } }
    end

    assert_redirected_to picture_test_url(PictureTest.last)
  end

  test "should show picture_test" do
    get picture_test_url(@picture_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_picture_test_url(@picture_test)
    assert_response :success
  end

  test "should update picture_test" do
    patch picture_test_url(@picture_test), params: { picture_test: { image_url: @picture_test.image_url, title: @picture_test.title } }
    assert_redirected_to picture_test_url(@picture_test)
  end

  test "should destroy picture_test" do
    assert_difference('PictureTest.count', -1) do
      delete picture_test_url(@picture_test)
    end

    assert_redirected_to picture_tests_url
  end
end
