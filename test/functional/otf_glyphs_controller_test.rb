require 'test_helper'

class OtfGlyphsControllerTest < ActionController::TestCase
  setup do
    @otf_glyph = otf_glyphs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:otf_glyphs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create otf_glyph" do
    assert_difference('OtfGlyph.count') do
      post :create, :otf_glyph => @otf_glyph.attributes
    end

    assert_redirected_to otf_glyph_path(assigns(:otf_glyph))
  end

  test "should show otf_glyph" do
    get :show, :id => @otf_glyph.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @otf_glyph.to_param
    assert_response :success
  end

  test "should update otf_glyph" do
    put :update, :id => @otf_glyph.to_param, :otf_glyph => @otf_glyph.attributes
    assert_redirected_to otf_glyph_path(assigns(:otf_glyph))
  end

  test "should destroy otf_glyph" do
    assert_difference('OtfGlyph.count', -1) do
      delete :destroy, :id => @otf_glyph.to_param
    end

    assert_redirected_to otf_glyphs_path
  end
end
