require 'test_helper'

class CostsControllerTest < ActionController::TestCase
  setup do
    @cost = costs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cost" do
    assert_difference('Cost.count') do
      post :create, cost: { cost_name: @cost.cost_name, cost_period: @cost.cost_period, cost_price: @cost.cost_price, store_id: @cost.store_id }
    end

    assert_redirected_to cost_path(assigns(:cost))
  end

  test "should show cost" do
    get :show, id: @cost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cost
    assert_response :success
  end

  test "should update cost" do
    patch :update, id: @cost, cost: { cost_name: @cost.cost_name, cost_period: @cost.cost_period, cost_price: @cost.cost_price, store_id: @cost.store_id }
    assert_redirected_to cost_path(assigns(:cost))
  end

  test "should destroy cost" do
    assert_difference('Cost.count', -1) do
      delete :destroy, id: @cost
    end

    assert_redirected_to costs_path
  end
end
