require 'test_helper'

class EnunciatedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enunciated_index_url
    assert_response :success
  end

  test "should get new" do
    get enunciated_new_url
    assert_response :success
  end

  test "should get create" do
    get enunciated_create_url
    assert_response :success
  end

  test "should get update" do
    get enunciated_update_url
    assert_response :success
  end

  test "should get edit" do
    get enunciated_edit_url
    assert_response :success
  end

  test "should get delete" do
    get enunciated_delete_url
    assert_response :success
  end

  test "should get show" do
    get enunciated_show_url
    assert_response :success
  end

end
