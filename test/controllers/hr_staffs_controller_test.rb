require 'test_helper'

class HrStaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hr_staff = hr_staffs(:one)
  end

  test "should get index" do
    get hr_staffs_url
    assert_response :success
  end

  test "should get new" do
    get new_hr_staff_url
    assert_response :success
  end

  test "should create hr_staff" do
    assert_difference('HrStaff.count') do
      post hr_staffs_url, params: { hr_staff: {  } }
    end

    assert_redirected_to hr_staff_url(HrStaff.last)
  end

  test "should show hr_staff" do
    get hr_staff_url(@hr_staff)
    assert_response :success
  end

  test "should get edit" do
    get edit_hr_staff_url(@hr_staff)
    assert_response :success
  end

  test "should update hr_staff" do
    patch hr_staff_url(@hr_staff), params: { hr_staff: {  } }
    assert_redirected_to hr_staff_url(@hr_staff)
  end

  test "should destroy hr_staff" do
    assert_difference('HrStaff.count', -1) do
      delete hr_staff_url(@hr_staff)
    end

    assert_redirected_to hr_staffs_url
  end
end
