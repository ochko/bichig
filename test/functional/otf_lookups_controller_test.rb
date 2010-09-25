require 'test_helper'

class OtfLookupsControllerTest < ActionController::TestCase
  setup do
    @otf_lookup = otf_lookups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:otf_lookups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create otf_lookup" do
    assert_difference('OtfLookup.count') do
      post :create, :otf_lookup => @otf_lookup.attributes
    end

    assert_redirected_to otf_lookup_path(assigns(:otf_lookup))
  end

  test "should show otf_lookup" do
    get :show, :id => @otf_lookup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @otf_lookup.to_param
    assert_response :success
  end

  test "should update otf_lookup" do
    put :update, :id => @otf_lookup.to_param, :otf_lookup => @otf_lookup.attributes
    assert_redirected_to otf_lookup_path(assigns(:otf_lookup))
  end

  test "should destroy otf_lookup" do
    assert_difference('OtfLookup.count', -1) do
      delete :destroy, :id => @otf_lookup.to_param
    end

    assert_redirected_to otf_lookups_path
  end
end
