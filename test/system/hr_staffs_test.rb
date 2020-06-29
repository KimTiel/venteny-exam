require "application_system_test_case"

class HrStaffsTest < ApplicationSystemTestCase
  setup do
    @hr_staff = hr_staffs(:one)
  end

  test "visiting the index" do
    visit hr_staffs_url
    assert_selector "h1", text: "Hr Staffs"
  end

  test "creating a Hr staff" do
    visit hr_staffs_url
    click_on "New Hr Staff"

    click_on "Create Hr staff"

    assert_text "Hr staff was successfully created"
    click_on "Back"
  end

  test "updating a Hr staff" do
    visit hr_staffs_url
    click_on "Edit", match: :first

    click_on "Update Hr staff"

    assert_text "Hr staff was successfully updated"
    click_on "Back"
  end

  test "destroying a Hr staff" do
    visit hr_staffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hr staff was successfully destroyed"
  end
end
