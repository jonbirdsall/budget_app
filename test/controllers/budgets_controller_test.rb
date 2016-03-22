require 'test_helper'

class BudgetsControllerTest < ActionController::TestCase
  setup do
    @budget = budgets(:one)
    @user = users(:michael)
  end

  test "should get index" do
    log_in_as @user
    get :index
    assert_response :success
    assert_not_nil assigns(:budgets)
  end

  test "should get new" do
    log_in_as @user
    get :new
    assert_response :success
  end

  test "should show budget" do
    log_in_as @user
    get :show, id: @budget
    assert_response :success
  end

  test "should get edit" do
    log_in_as @user
    get :edit, id: @budget
    assert_response :success
  end

  test "should update budget" do
    log_in_as @user
    patch :update, id: @budget, budget: { title: @budget.title }
    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should destroy budget" do
    log_in_as @user
    assert_difference('Budget.count', -1) do
      delete :destroy, id: @budget
    end

    assert_redirected_to root_url
  end
end
