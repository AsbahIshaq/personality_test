require 'test_helper'

class PictureTestAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @picture_test_answer = picture_test_answers(:one)
  end

  test "should get index" do
    get picture_test_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_picture_test_answer_url
    assert_response :success
  end

  test "should create picture_test_answer" do
    assert_difference('PictureTestAnswer.count') do
      post picture_test_answers_url, params: { picture_test_answer: { extent: @picture_test_answer.extent, picture_test_id: @picture_test_answer.picture_test_id, user_id: @picture_test_answer.user_id } }
    end

    assert_redirected_to picture_test_answer_url(PictureTestAnswer.last)
  end

  test "should show picture_test_answer" do
    get picture_test_answer_url(@picture_test_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_picture_test_answer_url(@picture_test_answer)
    assert_response :success
  end

  test "should update picture_test_answer" do
    patch picture_test_answer_url(@picture_test_answer), params: { picture_test_answer: { extent: @picture_test_answer.extent, picture_test_id: @picture_test_answer.picture_test_id, user_id: @picture_test_answer.user_id } }
    assert_redirected_to picture_test_answer_url(@picture_test_answer)
  end

  test "should destroy picture_test_answer" do
    assert_difference('PictureTestAnswer.count', -1) do
      delete picture_test_answer_url(@picture_test_answer)
    end

    assert_redirected_to picture_test_answers_url
  end
end
