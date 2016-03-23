module IncomesHelper
  def total_income(incomes)
    total = 0
    incomes.each do |income|
      total += income.amount
    end
  end
end
