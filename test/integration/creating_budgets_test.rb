require 'test_helper'

class CreatingBudgetsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  
  test "should redirect to root when not logged in" do
    assert_no_difference 'Budget.count' do
      post budgets_path, budget: { title: 'New test budget' }
    end
    assert_redirected_to login_url
  end
  
  test "should create budget" do
    log_in_as(@user)
    assert_difference 'Budget.count', 1 do
      post budgets_path, budget: { title: 'New test budget' }
    end
    assert_redirected_to root_url
  end
  
  test "should not create budget with empty title" do
    log_in_as(@user)
    assert_no_difference 'Budget.count' do
      post budgets_path, budget: { title: "" }
    end
    
    assert_template "new"
  end
end
