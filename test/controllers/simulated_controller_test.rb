require 'test_helper'

class SimulatedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get simulated_index_url
    assert_response :success
  end

  test "should get show" do
    get simulated_show_url
    assert_response :success
  end

  test "should get edit" do
    get simulated_edit_url
    assert_response :success
  end

  test "should get new" do
    get simulated_new_url
    assert_response :success
  end

  test "should get update" do
    get simulated_update_url
    assert_response :success
  end

  test "should get delete" do
    get simulated_delete_url
    assert_response :success
  end

  test "should get create" do
    get simulated_create_url
    assert_response :success
  end

end
