require "application_system_test_case"

class DayOffRequestsTest < ApplicationSystemTestCase
  setup do
    @day_off_request = day_off_requests(:one)
  end

  test "visiting the index" do
    visit day_off_requests_url
    assert_selector "h1", text: "Day Off Requests"
  end

  test "creating a Day off request" do
    visit day_off_requests_url
    click_on "New Day Off Request"

    fill_in "Day off date", with: @day_off_request.day_off_date
    fill_in "Reason", with: @day_off_request.reason
    click_on "Create Day off request"

    assert_text "Day off request was successfully created"
    click_on "Back"
  end

  test "updating a Day off request" do
    visit day_off_requests_url
    click_on "Edit", match: :first

    fill_in "Day off date", with: @day_off_request.day_off_date
    fill_in "Reason", with: @day_off_request.reason
    click_on "Update Day off request"

    assert_text "Day off request was successfully updated"
    click_on "Back"
  end

  test "destroying a Day off request" do
    visit day_off_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Day off request was successfully destroyed"
  end
end
