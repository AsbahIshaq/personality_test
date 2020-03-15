require "application_system_test_case"

class PictureTestAnswersTest < ApplicationSystemTestCase
  setup do
    @picture_test_answer = picture_test_answers(:one)
  end

  test "visiting the index" do
    visit picture_test_answers_url
    assert_selector "h1", text: "Picture Test Answers"
  end

  test "creating a Picture test answer" do
    visit picture_test_answers_url
    click_on "New Picture Test Answer"

    fill_in "Extent", with: @picture_test_answer.extent
    fill_in "Picture test", with: @picture_test_answer.picture_test_id
    fill_in "User", with: @picture_test_answer.user_id
    click_on "Create Picture test answer"

    assert_text "Picture test answer was successfully created"
    click_on "Back"
  end

  test "updating a Picture test answer" do
    visit picture_test_answers_url
    click_on "Edit", match: :first

    fill_in "Extent", with: @picture_test_answer.extent
    fill_in "Picture test", with: @picture_test_answer.picture_test_id
    fill_in "User", with: @picture_test_answer.user_id
    click_on "Update Picture test answer"

    assert_text "Picture test answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Picture test answer" do
    visit picture_test_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Picture test answer was successfully destroyed"
  end
end
