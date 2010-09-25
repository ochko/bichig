require 'test_helper'

class OtfClassesControllerTest < ActionController::TestCase
  setup do
    @otf_class = otf_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:otf_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create otf_class" do
    assert_difference('OtfClass.count') do
      post :create, :otf_class => @otf_class.attributes
    end

    assert_redirected_to otf_class_path(assigns(:otf_class))
  end

  test "should show otf_class" do
    get :show, :id => @otf_class.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @otf_class.to_param
    assert_response :success
  end

  test "should update otf_class" do
    put :update, :id => @otf_class.to_param, :otf_class => @otf_class.attributes
    assert_redirected_to otf_class_path(assigns(:otf_class))
  end

  test "should destroy otf_class" do
    assert_difference('OtfClass.count', -1) do
      delete :destroy, :id => @otf_class.to_param
    end

    assert_redirected_to otf_classes_path
  end
end
