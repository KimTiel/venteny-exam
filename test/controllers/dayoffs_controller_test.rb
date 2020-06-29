require 'test_helper'

class DayoffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dayoff = dayoffs(:one)
  end

  test "should get index" do
    get dayoffs_url
    assert_response :success
  end

  test "should get new" do
    get new_dayoff_url
    assert_response :success
  end

  test "should create dayoff" do
    assert_difference('Dayoff.count') do
      post dayoffs_url, params: { dayoff: { no_dayoff: @dayoff.no_dayoff } }
    end

    assert_redirected_to dayoff_url(Dayoff.last)
  end

  test "should show dayoff" do
    get dayoff_url(@dayoff)
    assert_response :success
  end

  test "should get edit" do
    get edit_dayoff_url(@dayoff)
    assert_response :success
  end

  test "should update dayoff" do
    patch dayoff_url(@dayoff), params: { dayoff: { no_dayoff: @dayoff.no_dayoff } }
    assert_redirected_to dayoff_url(@dayoff)
  end

  test "should destroy dayoff" do
    assert_difference('Dayoff.count', -1) do
      delete dayoff_url(@dayoff)
    end

    assert_redirected_to dayoffs_url
  end
end
