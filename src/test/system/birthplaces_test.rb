require "application_system_test_case"

class BirthplacesTest < ApplicationSystemTestCase
  setup do
    @birthplace = birthplaces(:one)
  end

  test "visiting the index" do
    visit birthplaces_url
    assert_selector "h1", text: "Birthplaces"
  end

  test "creating a Birthplace" do
    visit birthplaces_url
    click_on "New Birthplace"

    fill_in "Detail", with: @birthplace.detail
    fill_in "Prefecture", with: @birthplace.prefecture_id
    fill_in "User", with: @birthplace.user_id
    click_on "Create Birthplace"

    assert_text "Birthplace was successfully created"
    click_on "Back"
  end

  test "updating a Birthplace" do
    visit birthplaces_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @birthplace.detail
    fill_in "Prefecture", with: @birthplace.prefecture_id
    fill_in "User", with: @birthplace.user_id
    click_on "Update Birthplace"

    assert_text "Birthplace was successfully updated"
    click_on "Back"
  end

  test "destroying a Birthplace" do
    visit birthplaces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Birthplace was successfully destroyed"
  end
end
