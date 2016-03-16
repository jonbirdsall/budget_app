require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  test "budget title must not be empty" do
    budget = Budget.new
    assert budget.invalid?
    assert budget.errors[:title].any?
  end
end
