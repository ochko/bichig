require 'test_helper'

class ExamplesControllerTest < ActionController::TestCase
  setup do
    @example = examples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:examples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create example" do
    assert_difference('Example.count') do
      post :create, :example => @example.attributes
    end

    assert_redirected_to example_path(assigns(:example))
  end

  test "should show example" do
    get :show, :id => @example.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @example.to_param
    assert_response :success
  end

  test "should update example" do
    put :update, :id => @example.to_param, :example => @example.attributes
    assert_redirected_to example_path(assigns(:example))
  end

  test "should destroy example" do
    assert_difference('Example.count', -1) do
      delete :destroy, :id => @example.to_param
    end

    assert_redirected_to examples_path
  end
end
