require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  test "income source must not be empty" do
    income = Income.new
    assert income.invalid?
    assert income.errors[:source].any?
  end
  
  test "income amount must not be empty" do
    income = Income.new
    income.source = "work"
    assert income.invalid?
    assert income.errors[:amount].any?
  end
  
  test "valid info" do
    income = Income.new
    income.source = "work"
    income.amount = 1234.50
    assert income.valid?
    assert_not income.errors.any?
  end
end
