require 'test_helper'

class OtfFeaturesControllerTest < ActionController::TestCase
  setup do
    @otf_feature = otf_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:otf_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create otf_feature" do
    assert_difference('OtfFeature.count') do
      post :create, :otf_feature => @otf_feature.attributes
    end

    assert_redirected_to otf_feature_path(assigns(:otf_feature))
  end

  test "should show otf_feature" do
    get :show, :id => @otf_feature.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @otf_feature.to_param
    assert_response :success
  end

  test "should update otf_feature" do
    put :update, :id => @otf_feature.to_param, :otf_feature => @otf_feature.attributes
    assert_redirected_to otf_feature_path(assigns(:otf_feature))
  end

  test "should destroy otf_feature" do
    assert_difference('OtfFeature.count', -1) do
      delete :destroy, :id => @otf_feature.to_param
    end

    assert_redirected_to otf_features_path
  end
end
