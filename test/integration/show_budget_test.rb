require 'test_helper'

class ShowBudgetTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @budget = budgets(:one)
  end
  
  test "budget show page should list incomes" do
    log_in_as @user
    get budget_path(@budget)
    @budget.incomes.each do |income|
      assert_match income.source, response.body
    end
  end
end
