require 'test_helper'

class MainRoutesControllerTest < ActionController::TestCase
  setup do
    @main_route = main_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_route" do
    assert_difference('MainRoute.count') do
      post :create, main_route: { cost: @main_route.cost, route_name: @main_route.route_name }
    end

    assert_redirected_to main_route_path(assigns(:main_route))
  end

  test "should show main_route" do
    get :show, id: @main_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_route
    assert_response :success
  end

  test "should update main_route" do
    patch :update, id: @main_route, main_route: { cost: @main_route.cost, route_name: @main_route.route_name }
    assert_redirected_to main_route_path(assigns(:main_route))
  end

  test "should destroy main_route" do
    assert_difference('MainRoute.count', -1) do
      delete :destroy, id: @main_route
    end

    assert_redirected_to main_routes_path
  end
end
