require "test_helper"

class BirthplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @birthplace = birthplaces(:one)
  end

  test "should get index" do
    get birthplaces_url
    assert_response :success
  end

  test "should get new" do
    get new_birthplace_url
    assert_response :success
  end

  test "should create birthplace" do
    assert_difference('Birthplace.count') do
      post birthplaces_url, params: { birthplace: { detail: @birthplace.detail, prefecture_id: @birthplace.prefecture_id, user_id: @birthplace.user_id } }
    end

    assert_redirected_to birthplace_url(Birthplace.last)
  end

  test "should show birthplace" do
    get birthplace_url(@birthplace)
    assert_response :success
  end

  test "should get edit" do
    get edit_birthplace_url(@birthplace)
    assert_response :success
  end

  test "should update birthplace" do
    patch birthplace_url(@birthplace), params: { birthplace: { detail: @birthplace.detail, prefecture_id: @birthplace.prefecture_id, user_id: @birthplace.user_id } }
    assert_redirected_to birthplace_url(@birthplace)
  end

  test "should destroy birthplace" do
    assert_difference('Birthplace.count', -1) do
      delete birthplace_url(@birthplace)
    end

    assert_redirected_to birthplaces_url
  end
end
