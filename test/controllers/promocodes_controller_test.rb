require 'test_helper'

class PromocodesControllerTest < ActionController::TestCase
  setup do
    @promocode = promocodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promocodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promocode" do
    assert_difference('Promocode.count') do
      post :create, promocode: { codetext: @promocode.codetext, discount_value: @promocode.discount_value, timesused: @promocode.timesused, validity: @promocode.validity }
    end

    assert_redirected_to promocode_path(assigns(:promocode))
  end

  test "should show promocode" do
    get :show, id: @promocode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promocode
    assert_response :success
  end

  test "should update promocode" do
    patch :update, id: @promocode, promocode: { codetext: @promocode.codetext, discount_value: @promocode.discount_value, timesused: @promocode.timesused, validity: @promocode.validity }
    assert_redirected_to promocode_path(assigns(:promocode))
  end

  test "should destroy promocode" do
    assert_difference('Promocode.count', -1) do
      delete :destroy, id: @promocode
    end

    assert_redirected_to promocodes_path
  end
end
