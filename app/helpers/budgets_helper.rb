module BudgetsHelper
  def total_income(incomes)
    incomes.each do |income|
      total_income =+ income.amount
    end
  end
end
