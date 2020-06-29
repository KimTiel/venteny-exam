require 'test_helper'

class DayOffRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day_off_request = day_off_requests(:one)
  end

  test "should get index" do
    get day_off_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_day_off_request_url
    assert_response :success
  end

  test "should create day_off_request" do
    assert_difference('DayOffRequest.count') do
      post day_off_requests_url, params: { day_off_request: { day_off_date: @day_off_request.day_off_date, reason: @day_off_request.reason } }
    end

    assert_redirected_to day_off_request_url(DayOffRequest.last)
  end

  test "should show day_off_request" do
    get day_off_request_url(@day_off_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_off_request_url(@day_off_request)
    assert_response :success
  end

  test "should update day_off_request" do
    patch day_off_request_url(@day_off_request), params: { day_off_request: { day_off_date: @day_off_request.day_off_date, reason: @day_off_request.reason } }
    assert_redirected_to day_off_request_url(@day_off_request)
  end

  test "should destroy day_off_request" do
    assert_difference('DayOffRequest.count', -1) do
      delete day_off_request_url(@day_off_request)
    end

    assert_redirected_to day_off_requests_url
  end
end
