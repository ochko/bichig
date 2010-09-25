require 'test_helper'

class OtfUnicodesControllerTest < ActionController::TestCase
  setup do
    @otf_unicode = otf_unicodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:otf_unicodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create otf_unicode" do
    assert_difference('OtfUnicode.count') do
      post :create, :otf_unicode => @otf_unicode.attributes
    end

    assert_redirected_to otf_unicode_path(assigns(:otf_unicode))
  end

  test "should show otf_unicode" do
    get :show, :id => @otf_unicode.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @otf_unicode.to_param
    assert_response :success
  end

  test "should update otf_unicode" do
    put :update, :id => @otf_unicode.to_param, :otf_unicode => @otf_unicode.attributes
    assert_redirected_to otf_unicode_path(assigns(:otf_unicode))
  end

  test "should destroy otf_unicode" do
    assert_difference('OtfUnicode.count', -1) do
      delete :destroy, :id => @otf_unicode.to_param
    end

    assert_redirected_to otf_unicodes_path
  end
end
