require "application_system_test_case"

class PictureTestsTest < ApplicationSystemTestCase
  setup do
    @picture_test = picture_tests(:one)
  end

  test "visiting the index" do
    visit picture_tests_url
    assert_selector "h1", text: "Picture Tests"
  end

  test "creating a Picture test" do
    visit picture_tests_url
    click_on "New Picture Test"

    fill_in "Image url", with: @picture_test.image_url
    fill_in "Title", with: @picture_test.title
    click_on "Create Picture test"

    assert_text "Picture test was successfully created"
    click_on "Back"
  end

  test "updating a Picture test" do
    visit picture_tests_url
    click_on "Edit", match: :first

    fill_in "Image url", with: @picture_test.image_url
    fill_in "Title", with: @picture_test.title
    click_on "Update Picture test"

    assert_text "Picture test was successfully updated"
    click_on "Back"
  end

  test "destroying a Picture test" do
    visit picture_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Picture test was successfully destroyed"
  end
end
