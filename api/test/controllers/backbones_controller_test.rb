require 'test_helper'

class BackbonesControllerTest < ActionController::TestCase
  setup do
    @backbone = backbones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backbones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backbone" do
    assert_difference('Backbone.count') do
      post :create, backbone: { detail: @backbone.detail, name: @backbone.name }
    end

    assert_redirected_to backbone_path(assigns(:backbone))
  end

  test "should show backbone" do
    get :show, id: @backbone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backbone
    assert_response :success
  end

  test "should update backbone" do
    patch :update, id: @backbone, backbone: { detail: @backbone.detail, name: @backbone.name }
    assert_redirected_to backbone_path(assigns(:backbone))
  end

  test "should destroy backbone" do
    assert_difference('Backbone.count', -1) do
      delete :destroy, id: @backbone
    end

    assert_redirected_to backbones_path
  end
end
