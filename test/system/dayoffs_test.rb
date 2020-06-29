require "application_system_test_case"

class DayoffsTest < ApplicationSystemTestCase
  setup do
    @dayoff = dayoffs(:one)
  end

  test "visiting the index" do
    visit dayoffs_url
    assert_selector "h1", text: "Dayoffs"
  end

  test "creating a Dayoff" do
    visit dayoffs_url
    click_on "New Dayoff"

    fill_in "No dayoff", with: @dayoff.no_dayoff
    click_on "Create Dayoff"

    assert_text "Dayoff was successfully created"
    click_on "Back"
  end

  test "updating a Dayoff" do
    visit dayoffs_url
    click_on "Edit", match: :first

    fill_in "No dayoff", with: @dayoff.no_dayoff
    click_on "Update Dayoff"

    assert_text "Dayoff was successfully updated"
    click_on "Back"
  end

  test "destroying a Dayoff" do
    visit dayoffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dayoff was successfully destroyed"
  end
end
