require 'test_helper'

class TuitaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tuitum = tuita(:one)
  end

  test "should get index" do
    get tuita_url
    assert_response :success
  end

  test "should get new" do
    get new_tuitum_url
    assert_response :success
  end

  test "should create tuitum" do
    assert_difference('Tuitum.count') do
      post tuita_url, params: { tuitum: {  } }
    end

    assert_redirected_to tuitum_url(Tuitum.last)
  end

  test "should show tuitum" do
    get tuitum_url(@tuitum)
    assert_response :success
  end

  test "should get edit" do
    get edit_tuitum_url(@tuitum)
    assert_response :success
  end

  test "should update tuitum" do
    patch tuitum_url(@tuitum), params: { tuitum: {  } }
    assert_redirected_to tuitum_url(@tuitum)
  end

  test "should destroy tuitum" do
    assert_difference('Tuitum.count', -1) do
      delete tuitum_url(@tuitum)
    end

    assert_redirected_to tuita_url
  end
end
