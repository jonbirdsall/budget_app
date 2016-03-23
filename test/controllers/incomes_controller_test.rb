require 'test_helper'

class IncomesControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:michael)
    log_in_as @user
    @budget = budgets(:one)
    @income = incomes(:one)
  end
  

  test "show should display income list for specific budget" do
    get :show, id: @income.id
    @budget.incomes.each do |income|
      assert_match income.source, response.body
    end
  end

end
