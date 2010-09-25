require 'test_helper'

class OpenTypeFontsControllerTest < ActionController::TestCase
  setup do
    @open_type_font = open_type_fonts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:open_type_fonts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create open_type_font" do
    assert_difference('OpenTypeFont.count') do
      post :create, :open_type_font => @open_type_font.attributes
    end

    assert_redirected_to open_type_font_path(assigns(:open_type_font))
  end

  test "should show open_type_font" do
    get :show, :id => @open_type_font.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @open_type_font.to_param
    assert_response :success
  end

  test "should update open_type_font" do
    put :update, :id => @open_type_font.to_param, :open_type_font => @open_type_font.attributes
    assert_redirected_to open_type_font_path(assigns(:open_type_font))
  end

  test "should destroy open_type_font" do
    assert_difference('OpenTypeFont.count', -1) do
      delete :destroy, :id => @open_type_font.to_param
    end

    assert_redirected_to open_type_fonts_path
  end
end
